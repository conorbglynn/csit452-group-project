//
//  AddRecipeView.swift
//  GroupProject
//
//  Created by Conor Glynn on 12/1/24.
//

import SwiftUI
import PhotosUI

struct AddRecipeView: View {
    @EnvironmentObject var recipeVM: RecipeViewModel
    @State private var name: String =  ""
    @State private var description: String =  ""
    @State private var ingredients: String =  ""
    @State private var directions: String =  ""
    @State private var navigateToRecipes = false
    @State private var selectedItem: PhotosPickerItem?
    @State var image: Image = Image("recipe")
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Image")) {
                    PhotosPicker("Select an image", selection: $selectedItem, matching: .images)
                                    .onChange(of: selectedItem) {
                                        Task {
                                            if let image = try? await selectedItem?.loadTransferable(type: Image.self) {
                                                self.image = image
                                            }
                                        }
                                    }
                                    image
                                        .resizable()
                                        .scaledToFit()
                }
                
                Section(header: Text("Name")) {
                    TextField("Recipe Name", text: $name)
                }
                
                Section(header: Text("Description")) {
                    TextEditor(text: $description)
                }
                
                Section(header: Text("Ingredients")) {
                    TextEditor(text: $ingredients)
                }
                
                Section(header: Text("Directions")) {
                    TextEditor(text: $directions)
                }
                Button ("Add Recipe") {
                    saveRecipe()
                    navigateToRecipes = true
                }
                .sheet(isPresented: $navigateToRecipes) {
                    RecipeView(recipe: recipeVM.recipes.sorted{ $0.dateCreated > $1.dateCreated }[0])
                }
                .disabled(name.isEmpty)
            }
            .toolbar(content: {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        name = ""
                        description = ""
                        ingredients = ""
                        directions = ""
                    } label: {
                        Label("Cancel", systemImage: "xmark")
                            .labelStyle(.iconOnly)
                    }
                }
                
                
            })
            
                    
    
                .navigationTitle("Add Recipe")
                .navigationBarTitleDisplayMode(.inline)
        }
        .navigationViewStyle(.stack)

    }
}



struct AddRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        AddRecipeView()
            .environmentObject(RecipeViewModel())
    }
}

extension AddRecipeView {
    private func saveRecipe() {
        let addRecipe = Recipe(name: name, description: description, image: image, ingredients: ingredients, directions: directions, dateCreated: Date.now, searchCount: 0)
        recipeVM.addRecipe(newRecipe: addRecipe)
    }
}
