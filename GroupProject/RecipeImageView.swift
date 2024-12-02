//
//  RecipeImageView.swift
//  GroupProject
//
//  Created by Conor Glynn on 12/1/24.
//

import SwiftUI

struct RecipeImageView: View {
    var recipe: Recipe
    var body: some View {
        VStack {
            recipe.image
                .resizable()
                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                .overlay(alignment: .center){
                    Text(recipe.name)
                        .font(.title)
                        .foregroundStyle(.white)
                        .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: 3)
                        .frame(maxWidth: 140)
                }
                .frame(width: 170, height: 170, alignment: .center)
                .clipShape(Circle())
                .shadow(color: Color.black.opacity(0.25), radius: 10)
                    
                
        }
    }
}
    
    struct RecipeImage_Previews: PreviewProvider {
        static var previews: some View {
            RecipeImageView(recipe: Recipe.all[0])
                .environmentObject(RecipeViewModel())
        }
    }
