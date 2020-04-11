//
//  UIImage+Extension.swift
//  ArticlesApp
//
//  Created by DangTrungHieu on 4/11/20.
//  Copyright © 2020 DangTrungHieu. All rights reserved.
//

import UIKit
import SDWebImage

extension UIImageView {
//    func loadImage(by urlString: String, defaultImage: UIImage? = ImageManager.imagePlaceHolder) {
//        sd_setImage(with: urlString.addImageDomainIfNeeded().url,
//                    placeholderImage: defaultImage,
//                    options: .retryFailed,
//                    completed: nil)
//    }
    
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
