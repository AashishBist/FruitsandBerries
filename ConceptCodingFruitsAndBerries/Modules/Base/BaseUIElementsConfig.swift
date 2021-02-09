//
//  BaseUIElementsConfig.swift
//  ConceptCodingFruitsAndBerries
//
//  Created by ebpearls on 09/02/2021.
//  Copyright © 2021 ebpearls. All rights reserved.
//

import Foundation
import UIKit

class BaseTextField:UITextField{
    override convenience init(frame: CGRect) {
        self.init(frame: frame)
        let padding = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 50))
        self.leftView = padding
        self.leftViewMode = .always
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


