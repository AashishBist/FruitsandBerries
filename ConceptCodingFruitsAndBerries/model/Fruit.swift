//
//  Fruit.swift
//  ConceptCodingFruitsAndBerries
//
//  Created by ebpearls on 1/15/21.
//  Copyright © 2021 ebpearls. All rights reserved.
//

import Foundation
import UIKit

class Fruit {
    var name:String
    var price:Float
    var perLb:Float?
    var fruitImg:String
    var collectionFruitImg:[String]
    var color:UIColor
    //    change its name
    var imageTag:String
    var imageIndex:Int
    var productDescription:String
    
    
    init(name:String,price:Float,perLb:Float?,fruitImg:String,collectionFruitImg:[String],color:UIColor,imageTag:String,imageIndex:Int,productDescription:String) {
        self.name = name
        self.price = price
        self.perLb = perLb
        self.fruitImg = fruitImg
        self.collectionFruitImg = collectionFruitImg
        self.color = color
        self.imageTag = imageTag
        self.imageIndex = imageIndex
        self.productDescription = productDescription
    }
}



