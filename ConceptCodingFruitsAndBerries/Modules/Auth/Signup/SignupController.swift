//
//  SignupController.swift
//  ConceptCodingFruitsAndBerries
//
//  Created by ebpearls on 09/02/2021.
//  Copyright © 2021 ebpearls. All rights reserved.
//

import Foundation
import UIKit

class SignupController:BaseViewController{
   
    private lazy var screenView:SignupView = {
        baseView as! SignupView
    }()
    
    private lazy var screenViewModel:SignupViewModel = {
       baseViewModel as! SignupViewModel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

}
