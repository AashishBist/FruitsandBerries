//
//  SecondView.swift
//  ConceptCodingFruitsAndBerries
//
//  Created by ebpearls on 22/01/2021.
//  Copyright © 2021 ebpearls. All rights reserved.
//

import Foundation
import UIKit

class SecondView:BaseView{
    
    private lazy var scrollView:UIScrollView = {
        let scroll = UIScrollView()
        scroll.backgroundColor = .green
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    
    private lazy var textView:UITextView = {
        let view = UITextView()
        view.text = "Hello I am second Screen just for demo for MVVM-C Design Pattern"
        view.isEditable = false
        view.font = UIFont.italicSystemFont(ofSize: 20)
        view.backgroundColor = UIColor.init(white: 0.9, alpha: 0.5)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func create() {
        generateChildrens()
    }
    
    private func generateChildrens(){
        addSubview(scrollView)
        scrollView.addSubview(textView)
        NSLayoutConstraint.activate([scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
                                     textView.centerXAnchor.constraint(equalTo: centerXAnchor),textView.heightAnchor.constraint(equalToConstant: 50),textView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.5),textView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 20)])
    }
}
