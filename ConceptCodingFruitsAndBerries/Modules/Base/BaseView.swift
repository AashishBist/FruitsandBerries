
//
//  BaeView.swift
//  ConceptCodingFruitsAndBerries
//
//  Created by ebpearls on 1/15/21.
//  Copyright © 2021 ebpearls. All rights reserved.
//

import Foundation
import UIKit

class BaseView:UIView{
   
//    lazy var BaseTextField:UITextField = {
//       let textfield = UITextField()
//        let padding = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 50))
//        textfield.leftView = padding
//        textfield.leftViewMode = .always
//        textfield.autocorrectionType = .no
//        textfield.autocapitalizationType = .none
//        textfield.translatesAutoresizingMaskIntoConstraints = false
//        return textfield
//    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        create()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
//        create()
        
    }
    
    func create(){
        self.backgroundColor = .white
        self.clipsToBounds = true
    }
    
    deinit {
        debugPrint("De-Initialized -> \(String(describing: self))")
    }

   
}

extension UIView{
    func pin(to superView:UIView){
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([leadingAnchor.constraint(equalTo: superView.leadingAnchor),trailingAnchor.constraint(equalTo: superView.trailingAnchor),bottomAnchor.constraint(equalTo: superView.bottomAnchor),topAnchor.constraint(equalTo: superView.topAnchor)])
    }
}

