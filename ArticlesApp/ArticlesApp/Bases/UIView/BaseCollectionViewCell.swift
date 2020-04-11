//
//  BaseCollectionViewCell.swift
//  ArticlesApp
//
//  Created by DangTrungHieu on 4/10/20.
//  Copyright © 2020 DangTrungHieu. All rights reserved.
//

import UIKit

class BaseCollectionViewCell: UICollectionViewCell, Reusable {
 
    // MARK: - Life Cycles
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupDefault()
        initialize()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupDefault()
        initialize()
    }
    
    func initialize() {}
    
    // MARK: - Layouts
    
    private func setupDefault() {
        backgroundColor = UIColor.clear
    }
    
}
