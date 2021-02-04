//
//  FruitsView.swift
//  ConceptCodingFruitsAndBerries
//
//  Created by ebpearls on 1/15/21.
//  Copyright © 2021 ebpearls. All rights reserved.
//

import Foundation
import UIKit

final class FruitsView:BaseView{

    var fruit:Fruit?
    var image = CollectionViewImage()
    
    var numberOfItemsInCart = 1
    
    lazy var leftNavBtn:UIButton = {
        let lbtn = UIButton()
        lbtn.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        lbtn.backgroundColor = UIColor(white: 0.9, alpha: 0.6)
        lbtn.tintColor = .black
        lbtn.layer.cornerRadius = 10
        lbtn.frame = CGRect(x: 0, y: 40, width: 40, height: 40)
        return lbtn
    }()
    
     lazy var rightNavBtn:UIButton = {
        let rbtn = UIButton()
        rbtn.setImage(UIImage(systemName: "line.horizontal.3.decrease"), for: .normal)
        rbtn.tintColor = .black
        return rbtn
    }()
    
    lazy var topFruitCollectionView:UICollectionView = {
        let flowlayout = UICollectionViewFlowLayout()
        flowlayout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowlayout)
        collectionView.backgroundColor = .clear
        collectionView.contentMode = .scaleAspectFill
        collectionView.isPagingEnabled = true
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private lazy var fruitImage:UIImageView = {
        let imageView = UIImageView()
        guard let fruit = self.fruit else {return imageView}
        imageView.image = UIImage(named: fruit.fruitImg)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var topScrollView:UIScrollView = {
       let scrollview = UIScrollView()
        scrollview.isScrollEnabled = true
        scrollview.translatesAutoresizingMaskIntoConstraints = false
        return scrollview
    }()
    private lazy var scrollView:UIScrollView = {
        let scrollview = UIScrollView()
        scrollview.backgroundColor = .none
//        scrollview.isScrollEnabled = true
//        scrollview.isDirectionalLockEnabled = true
//        scrollview.contentSize = CGSize(width: frame.size.width, height: 2200)
        scrollview.translatesAutoresizingMaskIntoConstraints = false
        return scrollview
    }()
    
    private lazy var topContainer:UIView = {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        container.backgroundColor = .none
        return container
    }()
    
    private lazy var bottomContainer:UIView = {
        let container = UIView()
        
        container.backgroundColor = .white
//        container.clipsToBounds = true
        container.layer.cornerRadius = 40
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    private lazy var fruitNameLabel:UILabel = {
       let label = UILabel()
        guard let fruit = self.fruit else {return label}
        label.text = fruit.name
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
     lazy var fruitNutritionalValueButton:UIButton = {
       let nutritionButton = UIButton()
        nutritionButton.backgroundColor = fruit?.color
        nutritionButton.setTitle("Nutritional Value", for: .normal)
        nutritionButton.setTitleColor(.black, for: .normal)
        nutritionButton.tintAdjustmentMode = .dimmed
        nutritionButton.layer.borderWidth = 2
        nutritionButton.layer.borderColor = CGColor(red: 180/255, green: 130/255, blue: 80/255, alpha: 0.8)
        nutritionButton.layer.cornerRadius = 20
        nutritionButton.translatesAutoresizingMaskIntoConstraints = false
//        nutritionButton.addTarget(self, action: #selector(NutritionButtonClicked), for: .touchUpInside)
        return nutritionButton
    }()
    
    
    
    private lazy var perLbOrEachLabel:UILabel = {
        let label = UILabel()
        guard let fruit = self.fruit else {return label}
        if fruit.perLb == nil {
            label.text = "1 each"
        }else{
            label.text = "per \(fruit.perLb!) lb"
        }
        label.font = UIFont.systemFont(ofSize: 14, weight: .light)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var priceLabel:UILabel = {
        let label = UILabel()
        guard let fruit = fruit else {return label}
        label.text = "$\(fruit.price)"
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var buttonStack:UIStackView = {
       let buttonStack = UIStackView()
        buttonStack.axis = .horizontal
        buttonStack.distribution = .fillEqually
        buttonStack.backgroundColor = UIColor(white: 250/255, alpha: 0.9)
        buttonStack.isUserInteractionEnabled = true
        buttonStack.translatesAutoresizingMaskIntoConstraints = false
        return buttonStack
    }()
    
    private lazy var increaseItemNumberButton:UIButton = {
        let plusButton = UIButton()
        plusButton.setImage(UIImage(systemName: "plus"), for: .normal)
        plusButton.tintColor = .black
        plusButton.addTarget(self, action: #selector(increaseItemsButtonClicked), for: .touchUpInside)
        plusButton.translatesAutoresizingMaskIntoConstraints = false
        return plusButton
    }()
    
    private lazy var decreaseItemNumberButton:UIButton = {
        let minusButton = UIButton()
        minusButton.setImage(UIImage(systemName: "minus"), for: .normal)
        minusButton.tintColor = .black
        minusButton.addTarget(self, action: #selector(decreaseItemsButtonClicked), for: .touchUpInside)
        minusButton.translatesAutoresizingMaskIntoConstraints = false
        return minusButton
    }()
    
    private lazy var numberofItemsTextView:UITextView = {
        let textView = UITextView()
        textView.isEditable = false
        textView.text = "\(numberOfItemsInCart)"
        textView.textAlignment = .center
        textView.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    private lazy var productDescriptionTitle:UILabel = {
        let label = UILabel()
         label.font = UIFont.boldSystemFont(ofSize: 20)
         label.text = "Product Description"
         label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var productDescription:UILabel = {
        let label = UILabel()
        
        guard let fruit = fruit else {return label}
        label.text = fruit.productDescription
        label.font = UIFont.systemFont(ofSize: 16, weight: .light)
        label.numberOfLines = 4
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var addToCartButton:UIButton = {
        let addButton = UIButton()
        addButton.backgroundColor = fruit?.color
        addButton.setTitle("Add to cart", for: .normal)
        addButton.setTitleColor(.black, for: .normal)
        addButton.setTitleShadowColor(.darkGray, for: .normal)
        addButton.clipsToBounds = true
        addButton.layer.cornerRadius = 20
        addButton.layer.borderWidth = 2
        addButton.layer.borderColor = CGColor(srgbRed: 180/255, green: 130/255, blue: 80/255, alpha: 0.5)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        return addButton
    }()
    
    private lazy var loveButton:UIButton = {
        var lbutton = UIButton()
        lbutton.setImage(UIImage(systemName: "suit.heart.fill"), for: .normal)

        guard let fruit = fruit else {return lbutton}
        lbutton.tintColor = fruit.color
        lbutton.layer.borderWidth = 1
        lbutton.clipsToBounds = true
        lbutton.layer.cornerRadius  = 20
        lbutton.layer.borderColor = CGColor(srgbRed: 180/255, green: 130/255, blue: 80/255, alpha: 0.5)
        lbutton.translatesAutoresizingMaskIntoConstraints = false
        return lbutton
    }()
    
//    lazy var itemview: UIView = {
//        let view = UIView()
//        guard let fruit = fruit else{return view}
////        view.backgroundColor = .blue
//        view.translatesAutoresizingMaskIntoConstraints = false
//        return view
//    }()
    
    lazy var fullScreenScrollView: UIScrollView = {
        let view = UIScrollView()
        view.isDirectionalLockEnabled = true
        view.isScrollEnabled = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func create() {
        super.create()
        generateChildrens()

    }
    
    
     private func generateChildrens(){
        
//        Mark:- Problem
        
        guard let fruit  = fruit else {return}
        backgroundColor = fruit.color
        addSubview(leftNavBtn)
        addSubview(rightNavBtn)
        addSubview(topScrollView)
        addSubview(fullScreenScrollView)
//        fullScreenScrollView.addSubview(itemview)
        addSubview(scrollView)
        addSubview(topContainer)
        
        topContainer.addSubview(topFruitCollectionView)
//        topContainer.addSubview(fruitImage)
        addSubview(bottomContainer)
        bottomContainer.addSubview(productDescriptionTitle)
        bottomContainer.addSubview(productDescription)
        bottomContainer.addSubview(fruitNameLabel)
        bottomContainer.addSubview(fruitNutritionalValueButton)
        bottomContainer.addSubview(perLbOrEachLabel)
        bottomContainer.addSubview(buttonStack)
        bottomContainer.addSubview(priceLabel)
        bottomContainer.addSubview(loveButton)
        bottomContainer.addSubview(addToCartButton)
        
        
        buttonStack.addArrangedSubview(decreaseItemNumberButton)
        buttonStack.addArrangedSubview(numberofItemsTextView)
        buttonStack.addArrangedSubview(increaseItemNumberButton)
        
        topScrollViewLayout()
        fullScreenScrollViewLayout()
        scrollViewLayout()
        setContainerLayout()
        fruitCollectionViewlAyout()
//        setImageLayout()
        setFruitName()
        setNutrtionalValueButtonLayout()
        perLborEachLabel()
        buttonStackLayout()
        priceLabelLayout()
        setProductDescriptionLayout()
        loveAndAddToCartButtonLayout()
    }
    private func topScrollViewLayout(){
        NSLayoutConstraint.activate([topScrollView.leadingAnchor.constraint(equalTo: topContainer.leadingAnchor, constant: 0),topScrollView.trailingAnchor.constraint(equalTo: topContainer.trailingAnchor, constant: 0),topScrollView.topAnchor.constraint(equalTo: topContainer.topAnchor, constant: 0),topScrollView.bottomAnchor.constraint(equalTo: topContainer.bottomAnchor, constant: 0)])
    }
    
    private func fullScreenScrollViewLayout(){
        NSLayoutConstraint.activate([fullScreenScrollView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),fullScreenScrollView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),fullScreenScrollView.topAnchor.constraint(equalTo: topAnchor, constant: 0),fullScreenScrollView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)])
    }
    
    private func scrollViewLayout(){
        NSLayoutConstraint.activate([scrollView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),scrollView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0), scrollView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),scrollView.topAnchor.constraint(equalTo: topContainer.bottomAnchor, constant: 0)])
    }
    
    private func setContainerLayout(){
        NSLayoutConstraint.activate([topContainer.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0),topContainer.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.5),topContainer.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 0),topContainer.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 0),
                                     
                                     bottomContainer.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 0),bottomContainer.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: 0),bottomContainer.topAnchor.constraint(equalTo: scrollView.topAnchor),bottomContainer.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 0)])
    }
    private func fruitCollectionViewlAyout(){
        NSLayoutConstraint.activate([topFruitCollectionView.leadingAnchor.constraint(equalTo: topScrollView.leadingAnchor, constant: 10),topFruitCollectionView.trailingAnchor.constraint(equalTo: topScrollView.trailingAnchor, constant: -10),
                                     topFruitCollectionView.heightAnchor.constraint(equalTo: topScrollView.heightAnchor, multiplier: 0.9),
            topFruitCollectionView.topAnchor.constraint(equalTo: topScrollView.topAnchor, constant: 0)])
    }
    
//    private func setImageLayout(){
//        NSLayoutConstraint.activate([fruitImage.centerXAnchor.constraint(equalTo: centerXAnchor),fruitImage.heightAnchor.constraint(equalTo: topFruitCollectionView.heightAnchor, multiplier: 0.8),fruitImage.widthAnchor.constraint(equalTo: topFruitCollectionView.widthAnchor, multiplier: 0.8),fruitImage.topAnchor.constraint(equalTo: topContainer.topAnchor, constant: 20),
//
//
//        ])
//    }
    
    private func setFruitName(){
        NSLayoutConstraint.activate([fruitNameLabel.leadingAnchor.constraint(equalTo: bottomContainer.leadingAnchor, constant: 30),fruitNameLabel.topAnchor.constraint(equalTo: bottomContainer.topAnchor, constant: 30),fruitNameLabel.widthAnchor.constraint(equalTo: bottomContainer.widthAnchor, multiplier: 0.4),fruitNameLabel.heightAnchor.constraint(equalToConstant: 40)])
    }
    
    private func setNutrtionalValueButtonLayout(){
        NSLayoutConstraint.activate([fruitNutritionalValueButton.trailingAnchor.constraint(equalTo: bottomContainer.trailingAnchor, constant: -20),fruitNutritionalValueButton.topAnchor.constraint(equalTo: fruitNameLabel.topAnchor, constant: 40),fruitNutritionalValueButton.widthAnchor.constraint(equalTo: fruitNameLabel.widthAnchor, multiplier: 1),fruitNutritionalValueButton.heightAnchor.constraint(equalTo: fruitNameLabel.heightAnchor, multiplier: 1)])
    }
    
    
    private func setProductDescriptionLayout(){
        NSLayoutConstraint.activate([productDescriptionTitle.leadingAnchor.constraint(equalTo: bottomContainer.leadingAnchor, constant: 20),
        productDescriptionTitle.trailingAnchor.constraint(equalTo: bottomContainer.trailingAnchor, constant: -20),
        productDescriptionTitle.topAnchor.constraint(equalTo: buttonStack.bottomAnchor,constant: 20),
        productDescriptionTitle.heightAnchor.constraint(equalToConstant: 20),
        
        
        
        productDescription.leadingAnchor.constraint(equalTo: bottomContainer.leadingAnchor, constant: 20),
        productDescription.trailingAnchor.constraint(equalTo: bottomContainer.trailingAnchor, constant: -20),
        productDescription.topAnchor.constraint(equalTo: productDescriptionTitle.bottomAnchor),
        productDescription.heightAnchor.constraint(equalToConstant: 100),])
    }
    
    private func perLborEachLabel(){
        NSLayoutConstraint.activate([perLbOrEachLabel.leadingAnchor.constraint(equalTo: fruitNameLabel.leadingAnchor, constant: 0),perLbOrEachLabel.widthAnchor.constraint(equalTo: fruitNameLabel.widthAnchor, multiplier: 1),perLbOrEachLabel.heightAnchor.constraint(equalTo: fruitNameLabel.heightAnchor, multiplier: 0.5),perLbOrEachLabel.topAnchor.constraint(equalTo: fruitNameLabel.bottomAnchor, constant: 20)])
    }
    
    private func buttonStackLayout(){
        NSLayoutConstraint.activate([buttonStack.leadingAnchor.constraint(equalTo: fruitNameLabel.leadingAnchor, constant: 0),buttonStack.widthAnchor.constraint(equalTo: perLbOrEachLabel.widthAnchor, multiplier: 0.9),buttonStack.heightAnchor.constraint(equalTo: fruitNameLabel.heightAnchor, multiplier: 0.95),buttonStack.topAnchor.constraint(equalTo: perLbOrEachLabel.bottomAnchor, constant: 20)])
    }
    
    
    private func priceLabelLayout(){
        NSLayoutConstraint.activate([priceLabel.trailingAnchor.constraint(equalTo: bottomContainer.trailingAnchor, constant: -20),priceLabel.widthAnchor.constraint(equalTo: buttonStack.widthAnchor, multiplier: 0.8),priceLabel.heightAnchor.constraint(equalTo: buttonStack.heightAnchor, multiplier: 0.8),priceLabel.topAnchor.constraint(equalTo: buttonStack.topAnchor, constant: 1)])
    }
    
    
    private func loveAndAddToCartButtonLayout(){
        NSLayoutConstraint.activate([loveButton.leadingAnchor.constraint(equalTo: fruitNameLabel.leadingAnchor, constant: 0),loveButton.widthAnchor.constraint(equalTo: addToCartButton.widthAnchor, multiplier: 0.3),
                                     loveButton.heightAnchor.constraint(equalTo: productDescription.heightAnchor, multiplier: 0.7),
        loveButton.topAnchor.constraint(equalTo: productDescription.bottomAnchor, constant: 10),
        addToCartButton.leadingAnchor.constraint(equalTo: loveButton.trailingAnchor, constant: 20),addToCartButton.widthAnchor.constraint(equalTo: bottomContainer.widthAnchor, multiplier: 0.6),addToCartButton.heightAnchor.constraint(equalTo: loveButton.heightAnchor, multiplier: 1),addToCartButton.topAnchor.constraint(equalTo: productDescription.bottomAnchor, constant: 10)])
    }
    
    @objc private func increaseItemsButtonClicked(){
        guard let fruit = fruit else {return}
        numberOfItemsInCart += 1
        numberofItemsTextView.text = "\(numberOfItemsInCart)"
        let newPrice = Float(numberOfItemsInCart)*fruit.price
        priceLabel.text = "$\(newPrice)"
        
    }
    
    @objc private func decreaseItemsButtonClicked(){
        guard let fruit = fruit else {return}
        numberOfItemsInCart = numberOfItemsInCart > 0 ? numberOfItemsInCart - 1 : numberOfItemsInCart
        numberofItemsTextView.text = "\(numberOfItemsInCart)"
        let newPrice = Float(numberOfItemsInCart)*fruit.price
        priceLabel.text = "$\(newPrice)"
    }
}


