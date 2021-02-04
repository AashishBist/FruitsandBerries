//
//  SecondController.swift
//  ConceptCodingFruitsAndBerries
//
//  Created by ebpearls on 22/01/2021.
//  Copyright © 2021 ebpearls. All rights reserved.
//

import Foundation
import UIKit

class SecondController:BaseViewController{
    private lazy var screenView:SecondView = {
        baseView as! SecondView
    }()
    
    private lazy var screenViewModel:SecondViewModel = {
       baseViewModel as! SecondViewModel
    }()
}
