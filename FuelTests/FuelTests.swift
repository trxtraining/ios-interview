import Foundation
import Testing
@testable import Fuel

struct FuelTests {
    /// `recipes-sample.json` (in Preview Content) is a real response from
    /// `GET https://dummyjson.com/recipes?limit=3`, handy for previews and tests.
    @Test func sampleResponseIsAvailable() throws {
        let url = try #require(Bundle.main.url(forResource: "recipes-sample", withExtension: "json"))
        let data = try Data(contentsOf: url)
        #expect(!data.isEmpty)
    }
}
