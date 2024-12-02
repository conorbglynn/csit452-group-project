//
//  SearchView.swift
//  GroupProject
//
//  Created by Conor Glynn on 12/1/24.
//

import SwiftUI

struct SearchView: View {
    @EnvironmentObject var recipeVM: RecipeViewModel
    @State private var searchList: [String] = []
    @State private var search = ""
    @State private var searchResult: [UUID] = []
    @State private var navigateToSearch = false
    var body: some View {
        NavigationView {
            VStack{
                
                List {
                    ForEach(searchList, id: \.description) { name in
                        Text(name)
                    }
                }
                
                TextField("Add Ingredient", text: $search)
                    .autocorrectionDisabled()
                    .onSubmit {
                        if !search.isEmpty {
                            searchList.append(search)
                            search = ""
                        }
                    }
                HStack{
                    Button ("Clear list") {
                        print(searchList.count)
                        searchList = []
                    }
                    Spacer()
                    Button ("Search") {
                        print(searchList.count)
                        var result: [UUID] = []
                        for i in recipeVM.recipes{
                            let allMatch = searchList.allSatisfy { i.ingredients.lowercased().contains($0.lowercased())}
                            if allMatch{
                                result.append(i.id)
                            }
                        }
                        searchResult = result
                        print(searchResult)
                        navigateToSearch = true
                    }
                    .sheet(isPresented: $navigateToSearch) {
                        RecipeListView(recipes: recipeVM.recipes.filter{ searchResult.contains($0.id)})
                    }
                    
                }
                
                Divider()
                HStack{
                    Spacer()
                }
                .navigationTitle("Search Ingredients")
            }
            .padding(.top)
            
        }
        .padding(.horizontal)
        
    }
    
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
            .environmentObject(RecipeViewModel())
    }
}
