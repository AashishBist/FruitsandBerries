//
//  MyCustomCollectionCell.swift
//  ConceptCodingFruitsAndBerries
//
//  Created by ebpearls on 1/15/21.
//  Copyright © 2021 ebpearls. All rights reserved.
//

import UIKit

final class MyCustomCollectionCell: UICollectionViewCell {
    
    static var identifier = "MyCustomCollectionCell"
    
     var fruit:Fruit?
    
    private lazy var fruitContainerView:UIView = {
        
        let view = UIView()
        view.layer.cornerRadius = 20
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var fruitImageView: UIImageView = {
        let imageview = UIImageView(image: UIImage(named: fruit?.fruitImg ?? ""))
            imageview.translatesAutoresizingMaskIntoConstraints = false
            return imageview
    }()
    
    private lazy var perLblabel: UILabel = {
        let weightRate = UILabel()
        weightRate.font = UIFont.boldSystemFont(ofSize: 14)
        let value = fruit?.perLb ?? 0
        if value  == 0.87{
            weightRate.text = "Average \(value) lb"
        }
        else if value == 0 {
            weightRate.text = "$ \(fruit!.price) each"
        }else
        {
            weightRate.text = " \(value) lb"
        }
        
        weightRate.translatesAutoresizingMaskIntoConstraints = false
        return weightRate
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
//        label.backgroundColor = .red
        label.text = fruit?.name ?? " "
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private lazy var pricelabel: UILabel = {
        let label = UILabel()
        let value = fruit?.perLb ?? 0
//        Here value is 0 if price is already mentioned above perLbLabel
        if value == 0 {
            label.text = ""
        }else
        {
            label.text = "$ \(fruit!.price)"
        }
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private lazy var imgTagLabel:UILabel = {
        let label = UILabel()
        label.backgroundColor = fruit?.color
        label.text = fruit?.imageTag
        label.layer.borderWidth = 2
        label.layer.cornerRadius = 10
        label.layer.borderColor = .init(srgbRed: 253/255, green: 224/255, blue: 142/255, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func create(with fruit:Fruit){
        self.fruit = fruit
        generateChildrens()
    }
    
    private func generateChildrens(){
        guard let fruit = fruit else {return}
        fruitContainerView.backgroundColor = fruit.color
        contentView.addSubview(fruitContainerView)
        fruitContainerView.addSubview(fruitImageView)
        fruitContainerView.addSubview(nameLabel)
        fruitContainerView.addSubview(perLblabel)
        fruitContainerView.addSubview(pricelabel)
//        imgTagLabel.text = fruit.imageTag
        fruitContainerView.addSubview(imgTagLabel)
        NSLayoutConstraint.activate([fruitContainerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),fruitContainerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),fruitContainerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),fruitContainerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
                                     nameLabel.topAnchor.constraint(equalTo: fruitContainerView.topAnchor, constant: 5),nameLabel.leadingAnchor.constraint(equalTo: fruitContainerView.leadingAnchor, constant: 20),
                                     perLblabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),perLblabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor, constant: 0),perLblabel.heightAnchor.constraint(equalTo: pricelabel.heightAnchor, multiplier: 0.4),
                                     pricelabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor, constant: 0),pricelabel.topAnchor.constraint(equalTo: perLblabel.bottomAnchor, constant: 5),
                                     fruitImageView.topAnchor.constraint(equalTo: pricelabel.bottomAnchor, constant: 0),fruitImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 0),fruitImageView.widthAnchor.constraint(equalTo: fruitContainerView.widthAnchor, multiplier: 0.9),fruitImageView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.5),fruitImageView.bottomAnchor.constraint(equalTo: fruitContainerView.bottomAnchor, constant: -12),
                                     imgTagLabel.trailingAnchor.constraint(equalTo: fruitContainerView.trailingAnchor, constant: 0),
                                     imgTagLabel.bottomAnchor.constraint(equalTo: fruitContainerView.bottomAnchor, constant: 0),
                                     imgTagLabel.widthAnchor.constraint(equalTo: imgTagLabel.heightAnchor, multiplier: 1)
                                     ])
    }
}
