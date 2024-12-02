//
//  RecipeView.swift
//  GroupProject
//
//  Created by Conor Glynn on 12/1/24.
//

import SwiftUI

struct RecipeView: View {
    var recipe: Recipe
    
    var body: some View {
        ScrollView {
            recipe.image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea()
            .frame(height: 250)
            
            VStack(spacing: 30){
                Text(recipe.name)
                    .font(.largeTitle)
                    .bold()
                
                VStack(alignment: .leading, spacing: 30) {
                    Text(recipe.description)
                }
                
                VStack(alignment: .leading, spacing: 20) {
                    Text("Ingredients")
                        .font(.title2)
                    
                    Text(recipe.ingredients)
                }
                
                VStack(alignment: .leading, spacing: 20) {
                    Text("Directions")
                        .font(.title2)
                    
                    Text(recipe.directions)
                }
            }
            }
        }
    }


struct RecipeView_Previews: PreviewProvider {
    static var previews: some View{
        RecipeView(recipe: Recipe.all[0])
            .environmentObject(RecipeViewModel())
    }
}
