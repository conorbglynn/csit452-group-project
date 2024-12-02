//
//  ContentView.swift
//  GroupProject
//
//  Created by Conor Glynn on 12/1/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavBar()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(RecipeViewModel())
    }
}
