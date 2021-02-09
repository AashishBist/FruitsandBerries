//
//  SignupView.swift
//  ConceptCodingFruitsAndBerries
//
//  Created by ebpearls on 09/02/2021.
//  Copyright © 2021 ebpearls. All rights reserved.
//

import Foundation
import UIKit

class SignupView:BaseView{
    
    
    
    private lazy var email:BaseTextField = {
       let textfield = BaseTextField()
        textfield.placeholder = "Email"
        textfield.keyboardType = .emailAddress
        textfield.autocorrectionType = .no
//        textfield.leftView = padding
//        textfield.leftViewMode = .always
        return textfield
    }()

    
    override func create() {
        super.create()
        backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        generateChildren()
    }
    
    private func generateChildren(){
        
    }
}
