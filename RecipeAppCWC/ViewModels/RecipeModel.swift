//
//  RecipeModel.swift
//  RecipeAppCWC
//
//  Created by Rohit Singh on 2022-12-10.
//

import Foundation

class RecipeModel: ObservableObject {
    
    @Published var recipes = [Recipe]()
    
    init() {
        // Calling DataService type-method getLocalData() to get data.
        self.recipes = DataService.getLocalData()
    }
    
    // Function to get ingredient portions.
    static func getPortion(ingredient: Ingredient, recipeServings: Int, targetServings: Int) -> String {
        
        var portion = ""
        var numerator = ingredient.num ?? 1
        var denominator = ingredient.denom ?? 1
        var wholePortion = 0
        
        if ingredient.num != nil {
            
            // Get single serving size using (denominator x recipe servings).
            denominator *= recipeServings
            
            // Get targer portions using (numerator x target servings).
            numerator *= targetServings
            
            // Reduce fraction by GCD (Greatest Common Divisor).
            let divisor = Rational.greatestCommonDivisor(numerator, denominator)
            numerator /= divisor
            denominator /= divisor
            
            // If numerator > denominator, get whole portion.
            if numerator >= denominator {
                wholePortion = numerator / denominator
                // Calculate remainder.
                numerator = numerator % denominator
                // Append to portion.
                portion += String(wholePortion)
            }
            
            // Express remainder as fraction.
            if numerator > 0 {
                // Check whether to add space between portion and remainder.
                portion += wholePortion > 0 ? " " : ""
                // Assign remainder as fraction to portion.
                portion += "\(numerator)/\(denominator)"
            }
        }
        
        // Calculate appropriate singular/plural suffix for portions.
        if var unit = ingredient.unit {
            // Check whether we need to pluralize.
            if wholePortion > 1 {
                if unit.suffix(2) == "ch" {
                    unit += "es"
                } else if unit.suffix(1) == "f" {
                    unit = String(unit.dropLast())
                    unit += "ves"
                } else {
                    unit += "s"
                }
            }
            portion += ingredient.num == nil && ingredient.denom == nil ? "" : " "
            return portion + unit
        }
        return portion
    }
}
