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
        self.recipes = DataService.getLocalData()
    }
}
