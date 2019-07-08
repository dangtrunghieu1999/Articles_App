//
//  ItemTableViewCell.swift
//  DemoApp
//
//  Created by admin on 7/3/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class Dimension {
    static let normalMargin: CGFloat = 16
}

class ItemTableViewCell: UITableViewCell {
    
    // MARK: - Varibles
    
    public static let itemId = "itemId"
    private static let imageWidth: CGFloat         = 100.0
    private static let imageToMargin: CGFloat      = 20.0
    private static let margin_5: CGFloat           = 5.0
    private static let margin_15: CGFloat          = 15.0
    
    // MARK: - UI Elements
    
    private let logoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.layer.masksToBounds  = true
        imageView.layer.cornerRadius = 50
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.numberOfLines = 0
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.numberOfLines = 0
        return label
    }()
    
    // MARK: - View LifeCycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layoutLogoImage()
        layoutTitleLabel()
        layoutDescriptionLabel()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: - Public methods
    
    static func caculteCellHeight(by description: String) -> CGFloat {
        // caculate height for description label
        
        let desWidth = UIScreen.main.bounds.width - 5 - imageWidth - 15 - 15
        let desHeight = description.height(withConstrainedWidth: desWidth, font: UIFont.systemFont(ofSize: 15))
        let estimateTableHeight = imageToMargin + 30 + desHeight + imageToMargin + 5
        
        let estimateImageHeight = 2 * imageToMargin + imageWidth
        
        return max(estimateTableHeight, estimateImageHeight)
    }
    
    func setupItemCell(articles: ArticlesModel){
        titleLabel.text = articles.title
        logoImage.loadImageUsingUrlString(urlString: articles.image)
        descriptionLabel.text = articles.description
    }
    
    // MARK: Layout
    
    func layoutLogoImage() {
        self.addSubview(logoImage)
        logoImage.snp.makeConstraints { (make) in
            make.width.height.equalTo(ItemTableViewCell.imageWidth)
            make.left.equalToSuperview().offset(ItemTableViewCell.margin_5)
            make.top.equalToSuperview().offset(ItemTableViewCell.imageToMargin)
        }
    }
    
    func layoutTitleLabel() {
        self.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(logoImage)
            make.left.equalTo(logoImage.snp.right).offset(ItemTableViewCell.margin_15)
            make.right.equalToSuperview().offset(-ItemTableViewCell.margin_15)
        }
    }
    
    func layoutDescriptionLabel(){
        self.addSubview(descriptionLabel)
        descriptionLabel.snp.makeConstraints { (make) in
            make.width.equalTo(titleLabel.snp.width)
            make.top.equalTo(titleLabel.snp.bottom).offset(ItemTableViewCell.margin_5)
            make.left.equalTo(logoImage.snp.right).offset(ItemTableViewCell.margin_15)
        }
    }
    
}




