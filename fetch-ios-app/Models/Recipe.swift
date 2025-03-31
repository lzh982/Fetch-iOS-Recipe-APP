//
//  Recipe.swift
//  fetch-ios-app
//
//  Created by Zhihao Li on 03/30/25.
//

struct Recipe: Codable, Identifiable {
    let cuisine: String
    let name: String
    let photoUrlLarge: String?
    let photoUrlSmall: String?
    let uuid: String
    let sourceUrl: String?
    let youtubeUrl: String?

    enum CodingKeys: String, CodingKey {
        case cuisine
        case name
        case photoUrlLarge = "photo_url_large"
        case photoUrlSmall = "photo_url_small"
        case uuid
        case sourceUrl = "source_url"
        case youtubeUrl = "youtube_url"
    }
    
    // Computed property for Identifiable
    var id: String { uuid }
}


struct RecipesResponse: Decodable {
    let recipes: [Recipe]
}
