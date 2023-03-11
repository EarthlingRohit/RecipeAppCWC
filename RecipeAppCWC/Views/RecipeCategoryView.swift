//
//  RecipeCategoryView.swift
//  RecipeAppCWC
//
//  Created by Rohit Singh on 2023-03-10.
//

import SwiftUI

struct RecipeCategoryView: View {
    
    @EnvironmentObject var model: RecipeModel
    @Binding var selectedTab: Int
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Categories")
                .bold()
                .padding(.top, 20.0)
                .font(Font.custom("Avenir Heavy", size: 26.0))
            ScrollView(showsIndicators: false) {
                GeometryReader { geometry in
                    LazyVGrid(columns: [GridItem(.flexible(), spacing: 20.0, alignment: .top), GridItem(.flexible(), spacing: 20.0, alignment: .top)], alignment: .center, spacing: 20.0) {
                        ForEach(Array(model.categories), id: \.self) { category in
                            Button {
                                // Switch tab to list view.
                                selectedTab = Constants.listTab
                                // Set tapped category as category.
                                model.selectedCategory = category
                            } label: {
                                VStack() {
                                    Image(category.lowercased())
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: (geometry.size.width - 20.0)/2, height: (geometry.size.width - 20.0)/2)
                                        .cornerRadius(5.0)
                                        .clipped()
                                    Text(category)
                                        .foregroundColor(.black)
                                }
                            }
                        }
                    }
                    .padding(.bottom, 30.0)
                }
            }
        }
        .padding(.horizontal)
    }
}

/*
 struct RecipeCategoryView_Previews: PreviewProvider {
 static var previews: some View {
 RecipeCategoryView()
 }
 }
 */
