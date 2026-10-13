import SwiftUI

struct FavoritesView: View {
    @ObservedObject var viewModel = FavoritesViewModel()

    var body: some View {
        List {
            Section("Favorites") {
                ForEach(viewModel.favorites, id: \.name) { recipe in
                    HStack {
                        AsyncImage(url: URL(string: recipe.image))
                            .frame(width: 44, height: 44)

                        VStack(alignment: .leading) {
                            Text(recipe.name)
                            Text("Saved \(formattedDate(Date()))")
                                .font(.caption)
                        }

                        Spacer()

                        Image(systemName: "heart.fill")
                            .foregroundColor(.red)
                            .onTapGesture {
                                viewModel.toggle(recipe)
                            }
                    }
                }
            }

            Section("Recommended for you") {
                if viewModel.isLoading {
                    ProgressView()
                }
                ForEach(viewModel.recommendations, id: \.id) { recipe in
                    Text(recipe.name)
                }
            }
        }
        .navigationTitle("Favorites")
        .onAppear {
            viewModel.refresh()
        }
    }

    private func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        return formatter.string(from: date)
    }
}
