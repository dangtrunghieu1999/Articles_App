//
//  BaseViewController.swift
//  DemoApp
//
//  Created by admin on 4/11/1398 AP.
//  Copyright © 1398 admin. All rights reserved.
//

import UIKit

protocol ReusableView {
    func initialize()
}

class BaseViewController: UIViewController, ReusableView {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        initialize()
    }
    
    public func initialize() {}
}
