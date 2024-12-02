//
//  NavBar.swift
//  GroupProject
//
//  Created by Conor Glynn on 12/1/24.
//

import SwiftUI

struct NavBar: View {
    @StateObject var recipesViewModel = RecipeViewModel()
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("My Recipes", systemImage: "house")
                }
            
            AddRecipeView()
                .tabItem{
                    Label("Add Recipe", systemImage: "plus")
                }
            
            SearchView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
        }
        
    }
}

struct Previews: PreviewProvider {
    static var previews: some View{
        NavBar()
            .environmentObject(RecipeViewModel())
    }
}

