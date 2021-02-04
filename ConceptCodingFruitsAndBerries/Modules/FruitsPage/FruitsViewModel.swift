//
//  FruitsViewModel.swift
//  ConceptCodingFruitsAndBerries
//
//  Created by ebpearls on 1/15/21.
//  Copyright © 2021 ebpearls. All rights reserved.
//

import Foundation
import UIKit

final class FruitsViewModel:BaseViewModel{
    var fruit:Fruit
    
    init(with fruit: Fruit){
        self.fruit = fruit
    }
    
     let fruitCollectionView = CollectionViewImage()
}
