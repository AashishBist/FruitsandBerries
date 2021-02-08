//
//  TestCoordinator.swift
//  ConceptCodingFruitsAndBerries
//
//  Created by ebpearls on 22/01/2021.
//  Copyright © 2021 ebpearls. All rights reserved.
//

import Foundation
import UIKit

final class HomePageCoordinator{
    ///navigationController helps to navigate from one controller to another controller.
    private let navigationController:BaseNavigationController
    private var fruit:Fruit?
    
    init(navigationController:BaseNavigationController) {
        self.navigationController = navigationController
    }
    
    
    func start(){
        
        navigationController.makeNavBarTransparent(navigationController: navigationController)
        showHomePageController()
//        showFruitsPageController()
    }
    
//    Setting your first controller as rootController
    
    private func showHomePageController(){
        
        //1.Initialize
        let homeView = HomeView()
        let homeViewModel = HomeViewModel(with: fruitsArray)
        let homepageController = HomePageViewController(baseView: homeView, baseViewModel: homeViewModel)
//        to prevent auto reference cycle
//        We used unowned instead of weak as we know this coordinator will not be terminated until the end of app cycle.
        //2.Listen for trigger
        homeViewModel.trigger = { [unowned self] appRoute in
            //self = instance of Coordinator
//            self.showHomePageController()
            switch appRoute {
            case .secondPage:
                self.showSecondPageController()
            default:
                break
            }
    
        }
        //3.Navigate
        //Here we can't set homepageController as rootcontroller like earlier as it is only possible duting initializatiion of navigationController
        //navigationController.rootViewController(homePageController)
        //So we use 'setViewController' method to set homePageController as rootviewcontroller.
        navigationController.setViewControllers([homepageController], animated: false)
        
    }
    
    private func showFruitsPageController(){
        let fruitpageView = FruitsView()
                guard let fruit = fruit else {return}
        let fruitpageViewModel = FruitsViewModel(with: fruit)
        let fruitpageController  = FruitsViewController(baseView: fruitpageView, baseViewModel: fruitpageViewModel)

        navigationController.pushViewController(fruitpageController, animated: true)
        
    }
    
    private func showSecondPageController(){
        let secondView = SecondView()
        let secondViewModel = SecondViewModel()
        let secondPageController = SecondController(baseView: secondView, baseViewModel: secondViewModel)
        navigationController.pushViewController(secondPageController, animated: true)
    }
}


