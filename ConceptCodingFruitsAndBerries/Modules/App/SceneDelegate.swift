//
//  SceneDelegate.swift
//  ConceptCodingFruitsAndBerries
//
//  Created by ebpearls on 1/15/21.
//  Copyright © 2021 ebpearls. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var homePageCoordinator:HomePageCoordinator?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    
        ///1.Initialize UIWindow
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        
        /// 2. Initialize test Coordinator
        let baseNavigationController = BaseNavigationController()
        ///Make BaseNavigationController as navigatoncontroller for first coordinator i.e.homecoordinator
        homePageCoordinator = HomePageCoordinator(navigationController: baseNavigationController)
        
//        let homeView = HomeView()
//        let homeViewModel = HomeViewModel(with: fruits)
////        let homeViewModel = HomeViewModel(with: fruit)
////        2.Adding root controller to window and initializing homePageContoller
//        let homecontroller = HomePageViewController(baseView: homeView, baseViewModel: homeViewModel)
        
//        let navigationcontroller = BaseNavigationController(rootViewController: homecontroller)
        
/// 'makeNavBarTransparent' is now a method of BaseNavigationController
//        navigationcontroller.makeNavBarTransparent(navigationController: navigationcontroller)
        
        /// 3.Set the rootController of window.
        // BaseNavigationController is always the rootViewController
        window?.rootViewController = baseNavigationController
        
        ///
        /// 4.Show the window.
        window?.makeKeyAndVisible()
        
        //5. Start the coordinator.
        homePageCoordinator?.start()
    }

}

