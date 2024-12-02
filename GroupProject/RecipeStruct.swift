//
//  RecipeStruct.swift
//  GroupProject
//
//  Created by Conor Glynn on 12/1/24.
//

import Foundation
import SwiftUI

struct Recipe: Identifiable {
    let id = UUID()
    let name: String
    let description: String
    let image: Image
    let ingredients: String
    let directions: String
    let dateCreated: Date
    let searchCount: Int
}

extension Recipe {
    static let all: [Recipe] = [
    Recipe(
        name: "Cereal",
        description: "A bowl of cereal, which is \"a grass cultivated for its edible grain. Cereals are the world's largest crops, and are therefore staple foods. They include rice, wheat, rye, oats, barley, millet, and maize. Edible grains from other plant families, such as buckwheat and quinoa, are pseudocereals. Most cereals are annuals, producing one crop from each planting, though rice is sometimes grown as a perennial. Winter varieties are hardy enough to be planted in the autumn, becoming dormant in the winter, and harvested in spring or early summer; spring varieties are planted in spring and harvested in late summer. The term cereal is derived from the name of the Roman goddess of grain crops and fertility, Ceres.\" - Wikipedia",
        image: Image("recipe"),
        ingredients: "1 cup cereal\n1/2 cup Milk",
        directions: "Add ingredients together in bowl.",
        dateCreated: Date(timeIntervalSinceReferenceDate: 100),
        searchCount: 0),
    
    Recipe(
        name: "Cereal 2",
        description: "A bowl of cereal",
        image: Image("recipe"),
        ingredients: "1 cup cereal,\n1/2 cup Milk\nBowl",
        directions: "Add ingredients together in bowl.",
        dateCreated: Date.distantPast,
        searchCount: 0)
    //https://www.thedailymeal.com/img/gallery/11-healthy-cereals-that-are-actually-tasty/intro-1678891755.webp
    
    ]
}


