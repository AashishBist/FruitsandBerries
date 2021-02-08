
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

extension BaseView{
    
    ///This function helps to pin the subView in the mainView.
    func pin(to superView:BaseView){
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([leadingAnchor.constraint(equalTo: superView.leadingAnchor),trailingAnchor.constraint(equalTo: superView.trailingAnchor),heightAnchor.constraint(equalTo: superView.heightAnchor),topAnchor.constraint(equalTo: superView.topAnchor)])
    }
}
