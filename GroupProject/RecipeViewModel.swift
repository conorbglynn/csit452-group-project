//
//  RecipeViewModel.swift
//  GroupProject
//
//  Created by Conor Glynn on 12/1/24.
//

import Foundation

class RecipeViewModel: ObservableObject {
    @Published var recipes = [Recipe]()
    
    init() {
        recipes = Recipe.all
    }
    
    func addRecipe(newRecipe: Recipe) {
        recipes.append(newRecipe)
    }
    
}
