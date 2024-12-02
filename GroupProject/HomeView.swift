//
//  HomeView.swift
//  GroupProject
//
//  Created by Conor Glynn on 12/1/24.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var recipesVM: RecipeViewModel
    var body: some View {
        NavigationStack{
            ScrollView{
                RecipeListView(recipes: recipesVM.recipes)
            }
            .navigationTitle("My Recipes")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(RecipeViewModel())
    }
}
