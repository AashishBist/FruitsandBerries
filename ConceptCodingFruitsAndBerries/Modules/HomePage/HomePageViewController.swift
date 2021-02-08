//
//  HomePageViewController.swift
//  ConceptCodingFruitsAndBerries
//
//  Created by ebpearls on 1/15/21.
//  Copyright © 2021 ebpearls. All rights reserved.
//

import UIKit

//class HomePageViewController: BaseViewController {
class HomePageViewController: BaseViewController{
//   private lazy var homeview:HomeView = {
//       HomeView()
//
//    }()
    
//    screenview must be concrete type i.e. HomeVIEW
    private lazy var screenView:HomeView = {
        baseView as! HomeView
    }()
    
    private lazy var screenViewModel:HomeViewModel = {
        baseViewModel as! HomeViewModel
    }()

    
    /// setupUI is called before viewdid load
    /// Here we have included the collection view setup of homepage for collectionView
    override func setupUI() {
//        screenView.SearchBar.delegate = self
        screenView.collectionView.delegate = self
        screenView.collectionView.dataSource = self
        screenView.collectionView.register(MyCustomCollectionCell.self, forCellWithReuseIdentifier: MyCustomCollectionCell.identifier)
        
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func rightNavigationButtonClicked() {
        screenViewModel.trigger?(.secondPage)
    }
    
    
}


extension HomePageViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UITextFieldDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return fruitsArray.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCustomCollectionCell.identifier, for: indexPath) as! MyCustomCollectionCell
        
        cell.create(with: fruitsArray[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let fruit = fruitsArray[indexPath.row]
        let fruitModel = FruitsViewModel(with: fruit)
        let fruitView = FruitsView()
//        let nutritionModel = NutritionViewmodel(with: fruit)
//        let nutritionView = NutritionView()
//        We must initialize the controller in cooordinator use that instance here
        let fruitscontroller = FruitsViewController(baseView: fruitView, baseViewModel:fruitModel)
//        let nutritionController = NutritionalValueController(baseView: nutritionView, baseViewModel: nutritionModel)
        guard let navigationController = navigationController else {return}
        navigationController.pushViewController(fruitscontroller, animated: true)

    }
    
    
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
////        debugPrint(string)
//        if string.count<15{
//            return true
//        }else{
//            return false
//        }
        
//    }
    
}
