//
//  ArticleCollectionViewCell.swift
//  ArticlesApp
//
//  Created by DangTrungHieu on 4/10/20.
//  Copyright © 2020 DangTrungHieu. All rights reserved.
//

import UIKit

class ArticleCollectionViewCell: BaseCollectionViewCell {
    
    // MARK: - Variables
    
    // MARK: - Properties
    
    // MARK: - UI Elements
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = Dimension.shared.defaultHeigtImage / 2
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 15,weight: .semibold)
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 13)
        return label
    }()
    
    private let lineView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        return view
    }()
    
    // MARK: - ViewLifeCycles
    
    override func initialize() {
        super.initialize()
        layoutImageView()
        layoutTitleLabel()
        layoutDescriptionLabel()
        layoutLineView()
    }
    
    // MARK: - Helper Method
    
    // MARK: - Public Method
    
    public func configCell(by articles: Article) {
        self.imageView.loadImageUsingUrlString(urlString: articles.image)
        self.titleLabel.text       = articles.title
        self.descriptionLabel.text = articles.descriptions
    }
    
    // MARK: - Layout
    
    private func layoutImageView() {
        addSubview(imageView)
        imageView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(Dimension.shared.mediumMargin)
            make.left.equalToSuperview().offset(Dimension.shared.mediumMargin)
            make.height.width.equalTo(Dimension.shared.defaultHeigtImage)
            
        }
    }
    
    private func layoutTitleLabel() {
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(imageView)
            make.left.equalTo(imageView.snp.right).offset(Dimension.shared.smallMargin)
            make.right.equalToSuperview().offset(-Dimension.shared.mediumMargin)
        }
    }
    
    private func layoutDescriptionLabel() {
        addSubview(descriptionLabel)
        descriptionLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(Dimension.shared.smallMargin)
            make.left.right.equalTo(titleLabel)
        }
    }
    
    private func layoutLineView() {
        addSubview(lineView)
        lineView.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview()
            make.left.right.equalToSuperview()
            make.height.equalTo(1)
        }
    }
    
}
