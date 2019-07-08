//
//  ArticlesModel.swift
//  DemoApp
//
//  Created by admin on 7/4/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit
import SwiftyJSON

class ArticlesModel {
    let title: String
    let description: String
    let image: String
    let detail: String
    
    enum Key: String {
        case title          = "title"
        case description    = "description"
        case image          = "image"
        case detail         = "detail"
        
    }
    
    init(json: JSON) {
        self.title       = json[Key.title.rawValue].stringValue
        self.description = json[Key.description.rawValue].stringValue
        self.image       = json[Key.image.rawValue].stringValue
        self.detail      = json[Key.detail.rawValue].stringValue
    }
}

