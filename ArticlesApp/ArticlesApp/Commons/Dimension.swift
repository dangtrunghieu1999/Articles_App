//
//  Dimension.swift
//  ArticlesApp
//
//  Created by DangTrungHieu on 4/10/20.
//  Copyright © 2020 DangTrungHieu. All rights reserved.
//

import UIKit

let dimension = Dimension.shared

class Dimension {
    
    class var shared: Dimension {
        struct Static {
            static var instance = Dimension()
        }
        return Static.instance
    }
    
    var widthScreen: CGFloat = 1.0
    var heightScreen: CGFloat = 1.0
    var widthScale: CGFloat = 1.0
    var heightScale: CGFloat = 1.0
    
    // MARK: - Initialize
    
    private init() {
        self.widthScreen = UIScreen.main.bounds.width
        self.heightScreen = UIScreen.main.bounds.height
    }
    
    // MARK: - Spacing
    
    var smallMargin: CGFloat {
        return 4 * widthScale
    }
    
    var mediumMargin: CGFloat {
        return 8 * widthScale
    }
    
    var normalMargin: CGFloat {
        return 12 * widthScale
    }
    
    var largeMargin: CGFloat {
        return 16 * widthScale
    }
    
    var largeMargin_32: CGFloat {
        return 32 * widthScale
    }
    
    
    
    // MARK: - Height
    
    var defaultHeigtImage: CGFloat {
        return 100 * widthScale
    }
    
    
    
}
