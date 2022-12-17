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
            
            VStack(alignment: .leading) {
                
                Text("All Recipes")
                    .bold()
                    .padding(.top, 20.0)
                    .font(Font.custom("Avenir Heavy", size: 26.0))
                
                ScrollView {
                    LazyVStack(alignment: .leading) {
                        ForEach(model.recipes) { r in
                            
                            NavigationLink {
                                RecipeDetailView(recipe: r)
                            } label: {
                                HStack(spacing: 20.0) {
                                    
                                    // Recipe image.
                                    Image(r.image)
                                        .resizable()
                                        .frame(width: 70, height: 55, alignment: .leading)
                                        .aspectRatio(contentMode: .fill)
                                    
                                    VStack(alignment: .leading) {
                                        // Recipe name.
                                        Text(r.name)
                                            .font(Font.custom("Avenir Heavy", size: 18.0))
                                        RecipeHighlights(highlights: r.highlights)
                                    }
                                    .foregroundColor(.black)
                                }
                            }
                        }
                    }
                }
            }
            .navigationBarHidden(true)
            .padding(.leading)
        }
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
            .environmentObject(RecipeModel())
    }
}
