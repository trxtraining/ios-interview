# iOS Engineer Interview

Thanks for taking the time to interview with us! This repo contains everything we'll use during our one-hour session.
You'll share your screen and we'll work through two exercises together.

| Time | What |
| --- | --- |
| ~5 min | Introductions |
| ~30 min | **Exercise 1:** Build a small feature in the starter app ([`Exercise1-Feature.md`](Exercise1-Feature.md)) |
| ~20 min | **Exercise 2:** Review a teammate's pull request ([`Exercise2-CodeReview/`](Exercise2-CodeReview/)) |
| ~5 min | Your questions for us |

## Before the interview

Please take 5 minutes to make sure the project runs, so we can spend our time together on the fun parts:

1. Install **Xcode 16 or later**, with an **iOS 17+** simulator.
2. Open `Fuel.xcodeproj` and run the **Fuel** scheme (⌘R). You should see an empty "Recipes" screen.
3. Run the tests (⌘U). One placeholder test should pass.
4. Make sure your screen-sharing setup works and Xcode's font is large enough for us to read.

You're welcome to read through the exercises ahead of time, but please **don't write the solution in advance**,
we'd like to see how you work.

## Ground rules

- **Think out loud.** We're more interested in your reasoning and trade-offs than in a perfect result.
- **Use what you'd normally use.** Apple docs and search engines are fine. Prefer not to add third-party dependencies.
- **Ask questions.** If something is ambiguous, ask us, or make a reasonable call and tell us what you chose.
- **It's OK not to finish.** The exercises are sized to fit, but if we run short on time we'll just talk through the rest.

## Project layout

```
Fuel.xcodeproj
Fuel/
  App/FuelApp.swift                          App entry point
  Features/RecipeList/RecipeListView.swift   Exercise 1 starts here
  Preview Content/recipes-sample.json        Sample API response (for previews/tests)
FuelTests/                                   Unit tests (Swift Testing)
Exercise1-Feature.md                         Exercise 1 instructions
Exercise2-CodeReview/                        Exercise 2: the pull request to review
```

The project uses SwiftUI, targets iOS 17, and has no third-party dependencies.
