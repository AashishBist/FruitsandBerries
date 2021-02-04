//
//  FruitCollectionViewCell.swift
//  ConceptCodingFruitsAndBerries
//
//  Created by ebpearls on 1/19/21.
//  Copyright © 2021 ebpearls. All rights reserved.
//

import UIKit

final class FruitCollectionViewCell: UICollectionViewCell {
    
    static var identifier  = "FruitCollectionViewCell"
    var fruit:Fruit?
    
    lazy var  collectionFruitImage:UIImageView = {
        let imageView = UIImageView()
//        guard let fruit = fruit else {return imageView}
//        imageView.image = UIImage(named: fruit.fruitImg)
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    
    }()
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    func create(with image:UIImage){
        generateChildrens()
        collectionFruitImage.image = image
    
    }
    
    private func generateChildrens(){
        
        contentView.addSubview(collectionFruitImage)
        NSLayoutConstraint.activate([collectionFruitImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),collectionFruitImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),collectionFruitImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),collectionFruitImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)])
    }
}
