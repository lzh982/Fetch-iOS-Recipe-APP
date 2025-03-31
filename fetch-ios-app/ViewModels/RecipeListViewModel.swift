//
//  RecipeListViewModel.swift
//  fetch-ios-app
//
//  Created by Zhihao Li on 05/30/25.
//

import Foundation

class RecipeListViewModel: ObservableObject {
    @Published var recipe = [Recipe]()

    func fetchMeals() {
        if let url = URL(string:"https://d3jbb8n5wk0qxi.cloudfront.net/recipes.json") {
            URLSession.shared.dataTask(with: url) { data, _, error in
                if let data = data {
                    do {
                        let response = try JSONDecoder().decode(RecipesResponse.self, from: data)
                        DispatchQueue.main.async {
                            self.recipe = response.recipes.sorted(by: { $0.name < $1.name })
                        }
                    } catch {
                        print("Error decoding JSON: \(error)")
                    }
                } else if let error = error {
                    print("Network error: \(error)")
                }
            }.resume()
        }
    }
    
}
