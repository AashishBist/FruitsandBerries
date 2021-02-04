//
//  NutritionView.swift
//  ConceptCodingFruitsAndBerries
//
//  Created by ebpearls on 01/02/2021.
//  Copyright © 2021 ebpearls. All rights reserved.
//

import Foundation
import UIKit

class NutritionView:BaseView{
   
    var fruit:Fruit?
    
    override func create() {
        super.create()
        generateChildrens()
    }
    
    private func generateChildrens(){
        backgroundColor = fruit?.color ?? .brown
    }
    
    
    
}
