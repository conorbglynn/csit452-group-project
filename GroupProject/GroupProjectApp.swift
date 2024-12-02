//
//  GroupProjectApp.swift
//  GroupProject
//
//  Created by Conor Glynn on 12/1/24.
//

import SwiftUI

@main
struct GroupProjectApp: App {
    @StateObject var recipesViewModel = RecipeViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(recipesViewModel)
        }
    }
}
