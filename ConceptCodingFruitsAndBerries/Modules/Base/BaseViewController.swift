//
//  BaseViewController.swift
//  ConceptCodingFruitsAndBerries
//
//  Created by ebpearls on 1/18/21.
//  Copyright © 2021 ebpearls. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    public let baseView: BaseView
    
    public let baseViewModel: BaseViewModel
    
    private var rightNavButton:UIBarButtonItem?
    /// Initializer for a controller
    /// - Parameters:
    ///   - baseView: the view associated with the controller
    ///   - baseViewModel: viewModel associated with the controller
    public init(baseView:BaseView,baseViewModel:BaseViewModel){
        self.baseView = baseView
        self.baseViewModel = baseViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view = baseView
        
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    
    }
    
    
    /// We set up UIElements in setUpUI
    func setupUI(){}
    
    @objc func rightNavigationButtonClicked(){
        
    }
    /// The deinitializers in "Base" helps to know if the (view controller,viewmodel and view) view controller in this case is deinitialized or not i.e.removed from memory
    /// If not so we must assume that there is memory leak.
    deinit {
        debugPrint("De-Initialized -> \(String(describing: self))")
    }
}
