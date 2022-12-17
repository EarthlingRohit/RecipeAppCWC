//
//  RecipeHighlights.swift
//  RecipeAppCWC
//
//  Created by Rohit Singh on 2022-12-16.
//

import SwiftUI

struct RecipeHighlights: View {
    
    var allHighlights = ""
    
    init(highlights: [String]) {
        
        // Loop through highlights to build final highlights string.
        for index in 0..<highlights.count {
            // Check to not add comma in case of last item.
            if index == highlights.count - 1 {
                allHighlights += highlights[index]
            } else {
                allHighlights +=  highlights[index] + ", "
            }
        }
    }
    
    var body: some View {
        Text(allHighlights)
            .font(Font.custom("Avenir", size: 16.0))
    }
}

struct RecipeHighlights_Previews: PreviewProvider {
    static var previews: some View {
        RecipeHighlights(highlights: ["highlight1", "highlight2", "highlight3"])
    }
}
