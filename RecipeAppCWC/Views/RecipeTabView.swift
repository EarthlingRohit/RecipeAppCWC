//
//  RecipeTabView.swift
//  RecipeAppCWC
//
//  Created by Rohit Singh on 2022-12-11.
//

import SwiftUI

struct RecipeTabView: View {
    
    @State var selectedTab = Constants.featuredTab
    
    var body: some View {
        
        TabView(selection: $selectedTab) {
            
            // Tab 1.
            RecipeFeaturedView()
                .tabItem {
                    VStack {
                        Image(systemName: "star.fill")
                        Text("Featured")
                    }
                }
                .tag(Constants.featuredTab)
            
            // Tab 2.
            RecipeCategoryView(selectedTab: $selectedTab)
                .tabItem {
                    VStack {
                        Image(systemName: "square.grid.2x2")
                        Text("Categories")
                    }
                }
                .tag(Constants.categoriesTab)
            
            // Tab 3.
            RecipeListView()
                .tabItem {
                    VStack {
                        Image(systemName: "list.bullet")
                        Text("List")
                    }
                }
                .tag(Constants.listTab)
        }
        // Allow other views in view hierarchy to access same RecipeModel instance.
        .environmentObject(RecipeModel())
    }
}

struct RecipeTabView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeTabView()
    }
}
