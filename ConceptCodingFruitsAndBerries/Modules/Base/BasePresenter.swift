//
//  BasePresenter.swift
//  ConceptCodingFruitsAndBerries
//
//  Created by ebpearls on 21/01/2021.
//  Copyright © 2021 ebpearls. All rights reserved.
//

import Foundation
import UIKit


/// BasePresenter class sets the appearance for the navigation bar which was previously present in AppDelegate.swift.
class BasePresenter:UINavigationController{
    
    override func viewDidLoad() {

        let largeFont = UIFont.boldSystemFont(ofSize: 27.0)
        let smallFont = UIFont.boldSystemFont(ofSize: 20.0)
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .red
        appearance.titleTextAttributes = [.foregroundColor:UIColor.white , .font:smallFont]
        appearance.largeTitleTextAttributes = [.foregroundColor:UIColor.white , .font:largeFont]
        navigationBar.tintColor = .white
        UINavigationBar.appearance().standardAppearance  = appearance

    }
    
    func makeNavBarTransparent(navigationController: BaseNavigationController) {
        navigationController.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController.navigationBar.shadowImage = UIImage()
        navigationController.navigationBar.isTranslucent = true
        navigationController.navigationBar.tintColor = .black
    }
    
//
//    private func makeNavBarTransparent(navigationController: UINavigationController) {
//        navigationController.navigationBar.setBackgroundImage(UIImage(), for: .default)
//        navigationController.navigationBar.shadowImage = UIImage()
//        navigationController.navigationBar.isTranslucent = true
//        navigationController.navigationBar.tintColor = .black
//    }

}
