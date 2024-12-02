//
//  RecipeListView.swift
//  GroupProject
//
//  Created by Conor Glynn on 12/1/24.
//

import SwiftUI

struct RecipeListView: View {
    var recipes: [Recipe]
    var body: some View {
        NavigationView {
            VStack{
                HStack{
                    Spacer()
                }
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 170), spacing: 10)], spacing: 10) {
                    ForEach(recipes) {recipe in
                        NavigationLink(destination: RecipeView(recipe: recipe)) {
                            RecipeImageView(recipe: recipe)
                        }
                    }
                }
                
            }
            .padding(.top)
            
        }
        .padding(.horizontal)
    }
    
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView(recipes: Recipe.all)
            .environmentObject(RecipeViewModel())
    }
}

