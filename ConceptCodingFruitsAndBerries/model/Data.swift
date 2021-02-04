//
//  Data.swift
//  ConceptCodingFruitsAndBerries
//
//  Created by ebpearls on 1/15/21.
//  Copyright © 2021 ebpearls. All rights reserved.
//

import Foundation
import UIKit

 var fruitsArray:[Fruit] = {
   var fruits = [Fruit]()
    let strawberry = Fruit(name: "Strawberries", price: 2.45, perLb: 1.0, fruitImg: "strawberry", collectionFruitImg:["strawberry","strawberry1","strawberry2"],color: UIColor(red: 254/255, green: 200/255, blue: 255/255, alpha: 1), imageTag: "✓",imageIndex:0, productDescription: "Strawberry's tropical taste has a universal appeal.The meat has the sweetness of a peach. This red colored fruit has just enough fiber to give it some chewiness. ")
    let pineapple = Fruit(name: "Pineapple", price: 1.52, perLb: nil, fruitImg: "pineapple", collectionFruitImg:["pineapple","pineapple1","pineapple2"],color: UIColor(red: 254/255, green: 251/255, blue: 218/255, alpha: 1), imageTag: "➕",imageIndex:1,productDescription: "Pineapple's tropical taste has a universal appeal.The meat has the sweetness of a peach. This yellow colored fruit has just enough fiber to give it some chewiness. ")
    let blueberry = Fruit(name: "Blueberries", price: 4.07, perLb: 1.0, fruitImg: "blueberries",collectionFruitImg:["blueberries","blueberry1","blueberry2"] ,color: UIColor(red: 277/255, green: 228/255, blue: 255/255, alpha: 1), imageTag: "➕",imageIndex:2, productDescription: "Blueberry's tropical taste has a universal appeal.The fruit has the sweetness of a peach. This blue colored fruit has just enough fiber to give it some chewiness. ")
    let dragonfruit = Fruit(name: "Dragon Fruit", price: 5.36, perLb: 0.87, fruitImg: "dragonfruit",collectionFruitImg:["dragonfruit","dragonfruit1","dragonfruit2"] ,color: UIColor(red: 253/255, green: 239/255, blue: 254/255, alpha: 1), imageTag: "✓",imageIndex:3, productDescription: "DragonFruit's tropical taste has a universal appeal.The meat has the sweetness of a peach. This pink colored fruit has just enough fiber to give it some chewiness. ")
    let lychee = Fruit(name: "Lychee", price: 8.22, perLb: 1.0, fruitImg: "lychee",collectionFruitImg:["lychee","lychee1","lychee2"] ,color: UIColor(red: 213/255, green: 255/255, blue: 207/255, alpha: 1), imageTag: "➕",imageIndex:4, productDescription: "Lychee's tropical taste has a universal appeal.The meat has the sweetness of a peach. This red colored fruit has just enough fiber to give it some chewiness. ")
    let mango = Fruit(name: "Mango", price: 1.01, perLb: nil, fruitImg: "mango", collectionFruitImg:["mango","mango1","mango2"],color: UIColor(red: 253/255, green: 225/255, blue: 142/255, alpha: 1), imageTag: "✓",imageIndex:5, productDescription: "Mango's tropical taste has a universal appeal.The meat has the sweetness of a peach. This yellow colored fruit has just enough fiber to give it some chewiness. ")
    
    
    fruits.append(strawberry)
    fruits.append(pineapple)
    fruits.append(blueberry)
    fruits.append(dragonfruit)
    fruits.append(lychee)
    fruits.append(mango)
    return fruits
}()
