//
//  FruitsViewController.swift
//  ConceptCodingFruitsAndBerries
//
//  Created by ebpearls on 1/15/21.
//  Copyright © 2021 ebpearls. All rights reserved.
//

import UIKit


class FruitsViewController: BaseViewController,UIScrollViewDelegate,UIGestureRecognizerDelegate {
    
    ///lazy private var fruitview:FruitsView = {
    ///       let fruitview = FruitsView()
    ///       return fruitview
    ///    }()
    ///The above syntax lets the controller know how the instances of its view and viewmodel are initialized
    /// This syntax prevents the controller knowing how the view and viewModel are initialized.
    ///private lazy var screenView:FruitsView = {
    ///    baseView as! FruitsView
    /// }()
    private lazy var screenView:FruitsView = {
        baseView as! FruitsView
    }()
    
    private lazy var screenViewModel:FruitsViewModel? = {
        baseViewModel as! FruitsViewModel
    }()
    
    override func setupUI() {
        screenView.topFruitCollectionView.dataSource = self
        screenView.topFruitCollectionView.delegate = self
        screenView.topFruitCollectionView.register(FruitCollectionViewCell.self, forCellWithReuseIdentifier: FruitCollectionViewCell.identifier)
        setCustomNavigationBarButtons()
        screenView.fruitNutritionalValueButton.addTarget(self, action: #selector(NutritionButtonClicked), for: .touchUpInside)
        
    }
    @objc private func NutritionButtonClicked(){
    
        let nutritionController = NutritionalValueController(baseView: NutritionView(), baseViewModel: NutritionViewmodel())
        navigationController?.pushViewController(nutritionController, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let fruit = screenViewModel?.fruit else {return}
        self.screenView.fruit = fruit
        self.screenView.create()
        
    }
    
    @objc private func backButtonClicked(){
        navigationController?.popViewController(animated: true)
    }
    
    
    func setCustomNavigationBarButtons() {
        guard let _ = navigationController else {return}
        let leftBtn = screenView.leftNavBtn
        let rightBtn = screenView.rightNavBtn
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftBtn)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.backButtonClicked))
        tapGesture.delegate = self
        navigationItem.leftBarButtonItem!.customView!.addGestureRecognizer(tapGesture)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightBtn)
    }
    
    
    
    }

extension FruitsViewController:UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
        return (screenViewModel?.fruitCollectionView.fruitsImages[0].count)!
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FruitCollectionViewCell.identifier, for: indexPath) as! FruitCollectionViewCell
//        let fruit = fruitviewmodel?.fruit
        let fruit = screenViewModel?.fruit
//        let image = fruitCollection.fruitsImages[fruit!.imageIndex][indexPath.row]
        
///        Since model cant be directly accessed by ViewController it must be accessed through viewModel where we instabtiate the model.
        let image  = screenViewModel?.fruitCollectionView.fruitsImages[fruit!.imageIndex][indexPath.row]
        cell.create(with: image!)
        return cell
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width:CGFloat = collectionView.frame.width
        return CGSize(width: width, height: width*0.5)
    }
    

}

