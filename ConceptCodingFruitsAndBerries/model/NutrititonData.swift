//
//  NutrititonData.swift
//  ConceptCodingFruitsAndBerries
//
//  Created by ebpearls on 01/02/2021.
//  Copyright © 2021 ebpearls. All rights reserved.
//

import Foundation
import UIKit
struct FruitInformation:Codable {
    var genus:String
    var fruitName:String
    var fruitId:Int
    var fruitFamily:String
    var order:String
    var nutritions:[Nutritions]
    
    enum FruitInformationCodingKeys:String,CodingKey{
        case genus
        case fruitName = "name"
        case fruitId = "id"
        case fruitFamily = "family"
        case order
        case nutritions
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: FruitInformationCodingKeys.self)
        
        genus = try container.decode(String.self, forKey: .genus)
        fruitName = try container.decode(String.self, forKey: .fruitName)
        fruitId = try container.decode(Int.self, forKey: .fruitId)
        fruitFamily = try container.decode(String.self, forKey: .fruitFamily)
        order = try container.decode(String.self, forKey: .order)
        nutritions = try container.decode([Nutritions].self, forKey: .nutritions)
    }
}


struct Nutritions:Codable{
    
    var carbohydrates:Float
    var protein:Float
    var fat:Float
    var calories:Int
    var sugar:Float
    
    
    enum NutritionsCodingKeys:String,CodingKey{
        case carbohydrates
        case protein
        case fat
        case calories
        case sugar
    }
    
    //manually decoding JSON Data into object
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: NutritionsCodingKeys.self)
        
        carbohydrates = try container.decode(Float.self, forKey: .carbohydrates)
        protein = try container.decode(Float.self, forKey: .protein)
        fat = try container.decode(Float.self, forKey: .fat)
        calories = try container.decode(Int.self, forKey: .calories)
        sugar = try container.decode(Float.self, forKey: .sugar)
    }
    
    
    //manually encoding object into JSON Data to make compiler happy
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: NutritionsCodingKeys.self)
        
        try container.encode(carbohydrates, forKey: .carbohydrates)
        try container.encode(protein, forKey: .protein)
        try container.encode(fat, forKey: .fat)
        try container.encode(calories, forKey: .calories)
        try container.encode(sugar, forKey: .sugar)
    }
}
