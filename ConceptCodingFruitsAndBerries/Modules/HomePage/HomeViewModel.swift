//
//  HomeViewModel.swift
//  ConceptCodingFruitsAndBerries
//
//  Created by ebpearls on 1/15/21.
//  Copyright © 2021 ebpearls. All rights reserved.
//

import Foundation
import UIKit

class HomeViewModel:BaseViewModel{
    
    var fruits:[Fruit]
    
    
    init(with fruits: [Fruit]) { 
        
        self.fruits = fruits
        
    }
    //Whensome button is clicked to navigate trigger occures
    //These triggers cause DRY violation
    //Instead of this we make enum for these different caeses to listen these triggers
//    var gotohomePage: (()->Void)?
//    var gotoSecondPage:(()->Void)?
//    var gotoLoginPage: (()->Void)?
//    var gotoSignupPage: (()->Void)?
//    var gotoForgotPasswordPage: (()->Void)?
    
    
    var trigger: ((_ appRoute:AppRoutes) -> Void)?
}
