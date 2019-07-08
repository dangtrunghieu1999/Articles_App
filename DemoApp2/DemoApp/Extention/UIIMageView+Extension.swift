//
//  UIIMageView+Extension.swift
//  DemoApp
//
//  Created by admin on 7/4/19.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    func loadImageUsingUrlString(urlString: String) {
        let url = URL(string: urlString)!
        URLSession.shared.dataTask(with: url, completionHandler: { (data, respones, error) in
            
            if error != nil {
                print(error ?? "")
                return
            }
            
            DispatchQueue.main.async {
                self.image = UIImage(data: data!)
            }
            
        }).resume()
    }
    
}
