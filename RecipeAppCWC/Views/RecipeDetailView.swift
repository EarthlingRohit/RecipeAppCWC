//
//  RecipeDetailView.swift
//  RecipeAppCWC
//
//  Created by Rohit Singh on 2022-12-10.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var recipe: Recipe
    @State var selectedServingSize = 2
    
    var body: some View {
        
        ScrollView {
            
            VStack(alignment: .leading) {
                
                // MARK: Recipe image
                
                Image(recipe.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                
                // MARK: Recipe title
                Text(recipe.name)
                    .font(.largeTitle)
                    .bold()
                    .padding(.vertical, 10.0)
                
                // MARK: Serving size picker
                VStack(alignment: .leading) {
                    
                    Text("Select your serving size")
                    // Serving size picker
                    Picker("", selection: $selectedServingSize) {
                        Text("2").tag(2)
                        Text("4").tag(4)
                        Text("6").tag(6)
                        Text("8").tag(8)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .frame(width: 200)
                    .padding(.bottom, 5.0)
                }
                
                // MARK: Recipe ingredients
                
                VStack(alignment: .leading) {
                    
                    Text("Ingredients")
                        .font(.headline)
                        .padding(.vertical, 5)
                    
                    ForEach(recipe.ingredients) { item in
                        Text("• " + RecipeModel.getPortion(ingredient: item, recipeServings: recipe.servings, targetServings: selectedServingSize) + " " + item.name.lowercased())
                            .padding(.bottom, 0.5)
                    }
                }
                .padding(.bottom, 5.0)
                
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
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        // Create dummy recipe to allow preview
        let model = RecipeModel()
        RecipeDetailView(recipe: model.recipes[0])
    }
}
