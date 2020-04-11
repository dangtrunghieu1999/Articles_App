//
//  Article.swift
//  ArticlesApp
//
//  Created by DangTrungHieu on 4/10/20.
//  Copyright © 2020 DangTrungHieu. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


class Article: NSObject, JSONParsable {
    
    var title           = ""
    var image           = ""
    var descriptions    = ""
    var detail          = ""
    
    required override init() {}
    
    required init(json: JSON) {
        title        = json["title"].stringValue
        image        = json["image"].stringValue
        descriptions = json["description"].stringValue
        detail       = json["detail"].stringValue
    }
    
}
