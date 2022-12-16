//
//  RecipeFeaturedView.swift
//  RecipeAppCWC
//
//  Created by Rohit Singh on 2022-12-13.
//

import SwiftUI

struct RecipeFeaturedView: View {
    
    // Reference RecipeModel instance.
    @EnvironmentObject var model: RecipeModel
    // For recipe card button link to recipes.
    @State var isDetailViewShowing = false
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0.0) {
            
            Text("Featured Recipes")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.leading, 25.0)
            
            GeometryReader { geo in
                
                TabView {
                    // Loop through each recipe.
                    ForEach(0..<model.recipes.count) { index in
                        
                        // Show only featured recipes.
                        if model.recipes[index].featured == true {
                            
                            // Recipe card button.
                            Button {
                                // Show recipe detail view sheet.
                                self.isDetailViewShowing = true
                                
                            } label: {
                                // Featured recipe card.
                                ZStack {
                                    
                                    Rectangle()
                                        .foregroundColor(.white)
                                    
                                    VStack(spacing: 0.0) {
                                        // Featured recipe image.
                                        Image(model.recipes[index].image)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .clipped()
                                        
                                        // Featured recipe name.
                                        Text(model.recipes[index].name)
                                            .padding(.all, 5.0)
                                            .fontWeight(.bold)
                                    }
                                }
                            }
                            .sheet(isPresented: $isDetailViewShowing) {
                                // Show recipe detail view.
                                RecipeDetailView(recipe: model.recipes[index])
                            }
                            .buttonStyle(PlainButtonStyle())
                            .frame(width: geo.size.width - (1/8 * (geo.size.width)), height: geo.size.height - (1/8 * geo.size.height), alignment: .center)
                            .cornerRadius(10.0)
                            .padding(.bottom, 20.0)
                            .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.3), radius: 10, x: -2, y: 2)
                        }
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            }
            
            VStack(alignment: .leading, spacing: 10.0) {
                Text("Preparation Time:")
                    .font(.headline)
                Text("30 minutes")
                Text("Highlights:")
                    .font(.headline)
                Text("Tasty, Healthy, Yummy")
            }
            .padding([.leading, .bottom], 25.0)
        }
        .padding(.top, 20.0)
    }
}

struct RecipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeaturedView()
            .environmentObject(RecipeModel())
    }
}
