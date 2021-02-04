//
//  HomeView.swift
//  ConceptCodingFruitsAndBerries
//
//  Created by ebpearls on 1/15/21.
//  Copyright © 2021 ebpearls. All rights reserved.
//

import Foundation
import UIKit

final class HomeView:BaseView{
    
    var title = "Fruits and Berries"
    var fruits: [Fruit]?
    private lazy var leftNavBtn:UIButton = {
        let lbtn = UIButton()
        lbtn.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        lbtn.backgroundColor = UIColor(white: 0.9, alpha: 0.6)
        lbtn.tintColor = .black
        lbtn.layer.cornerRadius = 10
        lbtn.translatesAutoresizingMaskIntoConstraints = false
        return lbtn
    }()
    
    private lazy var rightNavBtn:UIButton = {
        let rbtn = UIButton()
        rbtn.setImage(UIImage(systemName: "line.horizontal.3.decrease"), for: .normal)
        rbtn.tintColor = .black
        rbtn.translatesAutoresizingMaskIntoConstraints = false
        return rbtn
    }()
    
    
    private lazy var headingLabel:UILabel = {
        let label = UILabel()
        label.text = "Fruits and Berries"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.backgroundColor = .clear
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .clear
        return label
    }()
    
    private let searchbarPadding = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
     private lazy var SearchBar:UITextField = {
        let bar = UITextField()
        bar.placeholder = "🔍 Search"
        bar.backgroundColor = UIColor(white: 0.9, alpha: 0.5)
        bar.leftView = searchbarPadding
        bar.leftViewMode = .always
        bar.translatesAutoresizingMaskIntoConstraints = false
        bar.layer.cornerRadius = 10
        return bar
    }()
    private lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.isUserInteractionEnabled = true
        view.isScrollEnabled = true
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var topContainer:UIView = {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    private lazy var collectionContainer:UIView = {
        let container = UIView()
//        container.backgroundColor = .gray
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
     lazy var collectionView:UICollectionView = {
        
        var numberofColumns = 2
        if UIDevice.current.orientation.isPortrait{
            numberofColumns = 2
        }else if UIDevice.current.orientation.isLandscape{
            numberofColumns = 2
        }
        let layout = TrainingLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .clear
        return cv
        
    }()
    
    override func create(){
//        If we dont do super.create() the function of base view is not called
        super.create()
        generateChildrens()
    }
    
    
    
    private func generateChildrens(){
        addSubview(leftNavBtn)
        addSubview(rightNavBtn)
        topContainer.addSubview(headingLabel)
        topContainer.addSubview(SearchBar)
        addSubview(scrollView)
        addSubview(topContainer)
        addSubview(collectionContainer)
        collectionContainer.addSubview(collectionView)
        setheadingLabelLayout()
        setSearchbarLayout()
        setScrollViewLayout()
        navButtonLayout()
        setContainerLayout()
        collectionViewLayout()
        
    }
    private func setheadingLabelLayout(){
        NSLayoutConstraint.activate([headingLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 20),
                                     headingLabel.heightAnchor.constraint(equalToConstant: 40),headingLabel.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 1),headingLabel.topAnchor.constraint(equalTo: leftNavBtn.bottomAnchor, constant: 20)])
          
    }
    
    private func setSearchbarLayout(){
        NSLayoutConstraint.activate([SearchBar.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
                                     SearchBar.heightAnchor.constraint(equalToConstant: 50),SearchBar.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.9),SearchBar.topAnchor.constraint(equalTo: headingLabel.bottomAnchor, constant: 10)])
    }
    
    private func setScrollViewLayout(){
        
        NSLayoutConstraint.activate([scrollView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 0),scrollView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 0),scrollView.topAnchor.constraint(equalTo: SearchBar.bottomAnchor, constant: 10),scrollView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)])
        
    }
    
    private func navButtonLayout(){
        NSLayoutConstraint.activate([leftNavBtn.heightAnchor.constraint(equalToConstant: 40),
                                     leftNavBtn.widthAnchor.constraint(equalToConstant: 40),
                                     leftNavBtn.topAnchor.constraint(equalTo: topAnchor, constant: 50),
                                     leftNavBtn.leadingAnchor.constraint(equalTo: headingLabel.leadingAnchor, constant: 0),rightNavBtn.heightAnchor.constraint(equalToConstant: 40),
                                     rightNavBtn.widthAnchor.constraint(equalToConstant: 40),
                                     rightNavBtn.topAnchor.constraint(equalTo: topAnchor, constant: 50),
                                     rightNavBtn.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -10)])
        
    }
    
    private func setContainerLayout(){
        NSLayoutConstraint.activate([topContainer.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 0),topContainer.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 0),topContainer.topAnchor.constraint(equalTo: leftNavBtn.bottomAnchor, constant: 0),topContainer.bottomAnchor.constraint(equalTo: SearchBar.bottomAnchor, constant: 0),collectionContainer.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 0),collectionContainer.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: 0),collectionContainer.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 0),collectionContainer.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 0)])
    }
    
    private func collectionViewLayout(){
        NSLayoutConstraint.activate([collectionView.leadingAnchor.constraint(equalTo: collectionContainer.leadingAnchor, constant: 0),collectionView.trailingAnchor.constraint(equalTo: collectionContainer.trailingAnchor, constant: 0),collectionView.topAnchor.constraint(equalTo: collectionContainer.topAnchor, constant: 0),collectionView.heightAnchor.constraint(equalTo: collectionContainer.heightAnchor, multiplier: 1)])
    }
    
    
}


