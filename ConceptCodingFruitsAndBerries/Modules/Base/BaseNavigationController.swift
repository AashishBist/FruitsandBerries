//
//  BaseNavigationController.swift
//  ConceptCodingFruitsAndBerries
//
//  Created by ebpearls on 21/01/2021.
//  Copyright © 2021 ebpearls. All rights reserved.
//

import Foundation

import UIKit

/// Used for push and pop of navigation controller.
class BaseNavigationController:UINavigationController{
    
    func makeNavBarTransparent(navigationController: BaseNavigationController) {
        navigationController.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController.navigationBar.shadowImage = UIImage()
        navigationController.navigationBar.isTranslucent = true
        navigationController.navigationBar.tintColor = .black
    }
    
}
