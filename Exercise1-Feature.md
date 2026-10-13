# Exercise 1 — Recipe List (~30 minutes)

**Fuel** is a nutrition app. Your task is to build its first screen: a list of recipes loaded from an API.

## API

```
GET https://dummyjson.com/recipes
```

No authentication is required. Abbreviated response:

```json
{
  "recipes": [
    {
      "id": 1,
      "name": "Classic Margherita Pizza",
      "prepTimeMinutes": 20,
      "cookTimeMinutes": 15,
      "difficulty": "Easy",
      "cuisine": "Italian",
      "caloriesPerServing": 300,
      "image": "https://cdn.dummyjson.com/recipe-images/1.webp",
      "rating": 4.6
      // ...more fields
    }
  ],
  "total": 50,
  "skip": 0,
  "limit": 30
}
```

A full sample response is in `Fuel/Preview Content/recipes-sample.json`.

## Requirements

1. Fetch recipes from the API when the screen appears.
2. Show them in a list. Each row should show:
   - the recipe **image**
   - the **name**
   - the **cuisine** and **difficulty**
   - the **total time** (prep + cook), e.g. "35 min"
3. Handle the **loading** and **error** states. When there's an error, the user should be able to retry.

Structure the code the way you would in a production app that will keep growing.

## If you have time

Pick any of these, or tell us what you'd do next and why:

- Pull to refresh
- Tapping a row opens a detail screen (ingredients and instructions are in the response)
- Search, using `GET https://dummyjson.com/recipes/search?q=pasta`
- Pagination, using the `limit` and `skip` query parameters
- Unit tests for your networking or view-model logic
