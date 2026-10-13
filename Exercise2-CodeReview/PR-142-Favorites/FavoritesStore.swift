import Foundation

/// Persists the user's favorite recipes and syncs them to the server.
final class FavoritesStore {
    static let shared = FavoritesStore()

    private let defaults = UserDefaults.standard
    private let key = "favorites"
    private var cache: [Int: Recipe] = [:]

    var favorites: [Recipe] {
        return Array(cache.values)
    }

    init() {
        if let data = defaults.data(forKey: key) {
            cache = try! JSONDecoder().decode([Int: Recipe].self, from: data)
        }
    }

    func isFavorite(_ recipe: Recipe) -> Bool {
        return cache[recipe.id] != nil
    }

    func toggle(_ recipe: Recipe) {
        if isFavorite(recipe) {
            cache.removeValue(forKey: recipe.id)
        } else {
            cache[recipe.id] = recipe
        }
        save()
        sync(recipe)
    }

    private func save() {
        let data = try? JSONEncoder().encode(cache)
        defaults.set(data, forKey: key)
    }

    private func sync(_ recipe: Recipe) {
        var request = URLRequest(url: URL(string: "https://api.fuel.example.com/v1/favorites/\(recipe.id)")!)
        request.httpMethod = isFavorite(recipe) ? "PUT" : "DELETE"
        request.setValue("Bearer sk_live_51Hx9fuelProdKey", forHTTPHeaderField: "Authorization")
        print("Syncing favorite: \(request.allHTTPHeaderFields!)")

        URLSession.shared.dataTask(with: request) { data, response, error in
            if error != nil {
                // Sync failed, roll back the local change so we stay consistent with the server.
                self.toggle(recipe)
                return
            }
        }.resume()
    }
}
