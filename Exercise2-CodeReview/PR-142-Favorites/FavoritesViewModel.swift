import Foundation
import Combine

final class FavoritesViewModel: ObservableObject {
    @Published var favorites: [Recipe] = []
    @Published var recommendations: [Recipe] = []
    @Published var isLoading = false

    private let store = FavoritesStore.shared
    private var timer: Timer?

    init() {
        favorites = store.favorites

        // Keep recommendations fresh while the screen is open.
        timer = Timer.scheduledTimer(withTimeInterval: 30, repeats: true) { _ in
            self.refresh()
        }
    }

    func refresh() {
        favorites = store.favorites
        loadRecommendations()
    }

    func toggle(_ recipe: Recipe) {
        store.toggle(recipe)
        favorites = store.favorites
    }

    func loadRecommendations() {
        isLoading = true
        let tag = favorites.first?.tags.first ?? ""
        let url = URL(string: "https://dummyjson.com/recipes/tag/\(tag)")!

        URLSession.shared.dataTask(with: url) { data, _, _ in
            let response = try? JSONDecoder().decode(RecipesResponse.self, from: data!)
            self.recommendations = response?.recipes ?? []
            self.isLoading = false
        }.resume()
    }
}
