//
//  DataService.swift
//  RecipeAppCWC
//
//  Created by Rohit Singh on 2022-12-10.
//

import Foundation

class DataService {
    
    // Function to parse JSON data.
    static func getLocalData() -> [Recipe] {
        
        // Get URL path to local JSON file.
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
        
        // Check whether pathString is nil.
        guard pathString != nil else {
            return [Recipe]()
        }
        
        // Create URL object.
        let url = URL(fileURLWithPath: pathString!)
        
        do {
            // Create Data object.
            let data = try Data(contentsOf: url)
            // Decode data with JSON Decoder.
            let decoder = JSONDecoder()
            do {
                let recipeData = try decoder.decode([Recipe].self, from: data)
                // Add unique IDs.
                for r in recipeData {
                    r.id = UUID()
                }
                // Return recipes.
                return recipeData
            } catch {
                print("Error while parsing JSON file")
            }
        } catch {
            print("Error while getting data")
        }
        // Return empty array of recipes in case Data object fails.
        return [Recipe]()
    }
}
