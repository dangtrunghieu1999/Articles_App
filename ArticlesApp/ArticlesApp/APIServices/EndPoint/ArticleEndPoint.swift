//
//  ArtiicleEndPoint.swift
//  ArticlesApp
//
//  Created by DangTrungHieu on 4/10/20.
//  Copyright © 2020 DangTrungHieu. All rights reserved.
//

import Foundation
import Alamofire

enum ArticleEndPoint {
    case getAllHome
}

extension ArticleEndPoint: EndPointType {
    var path: String {
        switch self {
        case .getAllHome:
            return ""
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .getAllHome:
            return .get
        }
    }
    
    var parameters: Parameters? {
        switch self {
        case .getAllHome:
            return nil
        }
    }
    
    
}
