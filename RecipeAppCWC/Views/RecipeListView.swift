//
//  RecipeListView.swift
//  RecipeAppCWC
//
//  Created by Rohit Singh on 2022-12-10.
//

import SwiftUI

struct RecipeListView: View {
    
    // Reference RecipeModel instance.
    @EnvironmentObject var model: RecipeModel
    
    var body: some View {
        
        NavigationView {
            
            List(model.recipes) { r in
                
                NavigationLink {
                    RecipeDetailView(recipe: r)
                } label: {
                    HStack(spacing: 20.0) {
                        
                        // Recipe image.
                        Image(r.image)
                            .resizable()
                            .frame(width: 70, height: 55, alignment: .leading)
                            .aspectRatio(contentMode: .fill)
                        
                        // Recipe name.
                        Text(r.name)
                    }
                }
            }
            .navigationBarTitle("All Recipes")
        }
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
    }
}
