# PR #142 — Add Favorites screen with recommendations

**Author:** @teammate · **Base:** `main` · **Files changed:** 3 (+150 / −0)

## What

Users can now favorite recipes. This PR adds:

- **`FavoritesStore`** — persists favorites locally so they survive app launches, and syncs each change to the backend (`PUT` / `DELETE /v1/favorites/:id`).
- **`FavoritesViewModel`** — exposes favorites plus "Recommended for you" recipes based on the tags of the user's favorites.
- **`FavoritesView`** — new screen that lists favorites (most recently saved first) with the date each one was saved, and a heart button to un-favorite. Below that, recommendations are shown, excluding recipes the user has already favorited.

## Why

Top request from beta feedback: "let me save recipes I like."

## How to test

Tested manually on the iPhone 16 simulator: favorited a few recipes, relaunched the app, favorites were still there.

## Notes

- `Recipe` and `RecipesResponse` are the existing `Codable` models from the app (`Recipe` has `id: Int`, `name`, `image`, `tags: [String]`, etc.).
- Wiring a "heart" button into the recipe list will come in a follow-up PR.
