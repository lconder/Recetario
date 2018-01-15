//
//  Recipe.swift
//  Recetario
//
//  Created by Luis Conde on 13/01/18.
//  Copyright © 2018 Luis Conde. All rights reserved.
//

import Foundation
import UIKit


class Recipe: NSObject {
    
    var name: String!
    var image: UIImage!
    var time: Int!
    var ingredients: [String]!
    var steps: [String]!
    
    var rating: String!
    
    init(name: String, image: UIImage?, time: Int, ingredients: [String], steps: [String]){
        
        self.name = name
        self.image = image
        self.ingredients = ingredients
        self.steps = steps
        self.time = time
        self.rating = "rating"
        
    }
    
    
}
