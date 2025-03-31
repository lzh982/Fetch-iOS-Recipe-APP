//
//  fetch_ios_appTests.swift
//  fetch-ios-appTests
//
//  Created by Zhihao Li on 3/30/25.
//

import Testing
import XCTest
@testable import fetch_ios_app

class RecipeListViewModelTests: XCTestCase {
    var viewModel: RecipeListViewModel!

    override func setUp() {
        super.setUp()
        viewModel = RecipeListViewModel()
    }

    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }

    // Test JSON Decoding
    func testRecipeDecoding() throws {
        let json = """
        {
            "recipes": [
                {
                    "cuisine": "British",
                    "name": "Bakewell Tart",
                    "photo_url_large": "https://some.url/large.jpg",
                    "photo_url_small": "https://some.url/small.jpg",
                    "uuid": "12345",
                    "source_url": "https://some.url/index.html",
                    "youtube_url": "https://www.youtube.com/watch?v=some.id"
                }
            ]
        }
        """.data(using: .utf8)!

        let decodedData = try JSONDecoder().decode(RecipesResponse.self, from: json)
        XCTAssertEqual(decodedData.recipes.count, 1)
        XCTAssertEqual(decodedData.recipes.first?.name, "Bakewell Tart")
        XCTAssertEqual(decodedData.recipes.first?.photoUrlLarge, "https://some.url/large.jpg")
        XCTAssertEqual(decodedData.recipes.first?.photoUrlSmall, "https://some.url/small.jpg")
        XCTAssertEqual(decodedData.recipes.first?.sourceUrl,"https://some.url/index.html")
        XCTAssertEqual(decodedData.recipes.first?.youtubeUrl,  "https://www.youtube.com/watch?v=some.id")

    }
}
