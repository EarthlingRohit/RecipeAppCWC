//
//  RecipeDetailView.swift
//  RecipeAppCWC
//
//  Created by Rohit Singh on 2022-12-10.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var recipe: Recipe
    
    var body: some View {
        
        ScrollView {
            
            VStack(alignment: .leading) {
                
                // MARK: Recipe image
                
                Image(recipe.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                
                // MARK: Recipe ingredients
                
                VStack(alignment: .leading) {
                    
                    Text("Ingredients")
                        .font(.headline)
                        .padding(.vertical, 5)
                    
                    ForEach(recipe.ingredients) { item in
                        Text("• " + item.name)
                            .padding(.bottom, 0.5)
                    }
                }
                
                Divider()
                
                // MARK: Recipe directions
                
                VStack(alignment: .leading) {
                    Text("Directions")
                        .font(.headline)
                        .padding(.vertical, 5)
                    ForEach(0..<recipe.directions.count, id: \.self) { index in
                        Text(String(index + 1) + ". " + recipe.directions[index])
                            .padding(.bottom, 0.5)
                    }
                }
            }
        }
        .padding(.all)
        .navigationBarTitle(recipe.name)
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        // Create dummy recipe to allow preview
        let model = RecipeModel()
        RecipeDetailView(recipe: model.recipes[0])
    }
}
