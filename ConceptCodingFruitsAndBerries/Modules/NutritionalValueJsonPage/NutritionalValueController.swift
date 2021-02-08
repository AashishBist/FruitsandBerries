//
//  NutritionalValueController.swift
//  ConceptCodingFruitsAndBerries
//
//  Created by ebpearls on 01/02/2021.
//  Copyright © 2021 ebpearls. All rights reserved.
//

import Foundation
import UIKit

class NutritionalValueController:BaseViewController{
    
//    var fruit:Fruit?
    
    
    private lazy var screenView:NutritionView = {
        baseView as! NutritionView
    }()
    
    private lazy var screenViewModel:NutritionViewmodel = {
       baseViewModel as! NutritionViewmodel
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screenView.create()
        
//         let fruit = screenViewModel.fruit else {return}
//        screenView.backgroundColor = fruit.color
//        screenView.backgroundColor = .red
    }
}
