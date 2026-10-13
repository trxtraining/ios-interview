import SwiftUI

/// Exercise 1 starts here. See `Exercise1-Feature.md` at the root of the repo.
///
/// Feel free to restructure, rename, or replace anything in this project.
struct RecipeListView: View {
    var body: some View {
        NavigationStack {
            ContentUnavailableView(
                "No Recipes Yet",
                systemImage: "fork.knife",
                description: Text("Load recipes from the API and show them here.")
            )
            .navigationTitle("Recipes")
        }
    }
}

#Preview {
    RecipeListView()
}
