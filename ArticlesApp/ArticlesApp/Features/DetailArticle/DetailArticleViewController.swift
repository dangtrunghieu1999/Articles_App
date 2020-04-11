

//
//  DetailArticleViewController.swift
//  ArticlesApp
//
//  Created by DangTrungHieu on 4/11/20.
//  Copyright © 2020 DangTrungHieu. All rights reserved.
//

import UIKit

class DetailArticleViewController: BaseViewController {
    
    // MARK: - Variables
    
    // MARK: - Properties
    
    // MARK: - UI Elements
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.isUserInteractionEnabled = true
        return scrollView
    }()
    
    fileprivate lazy var containerView: UIView = {
        let view = UIView()
        return view
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private let detailLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    
    // MARK: - ViewLifeCycles
    
    override func initialize() {
        super.initialize()
        navigationItem.title = "Detail Article"
        layoutScrollView()
        layoutContainerView()
        layoutImageView()
        layoutDetaiLabel()
    }
    
    // MARK: - Helper Method
    
    // MARK: - Public Method
    
    public func configData(by article: Article) {
        self.imageView.loadImageUsingUrlString(urlString: article.image)
        self.detailLabel.text = article.detail
    }
    
    // MARK: - Layout
    
    private func layoutScrollView() {
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { (make) in
            if #available(iOS 11.0, *) {
                make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            } else {
                make.top.equalTo(topLayoutGuide.snp.bottom)
            }
            make.left.right.bottom.equalToSuperview()
        }
    }
    
    private func layoutContainerView() {
        scrollView.addSubview(containerView)
        containerView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(Dimension.shared.normalMargin)
            make.width.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    private func layoutImageView() {
        containerView.addSubview(imageView)
        imageView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(Dimension.shared.smallMargin)
            make.centerX.equalToSuperview()
            make.height.width.equalTo(150)
        }
    }
    
    private func layoutDetaiLabel() {
        containerView.addSubview(detailLabel)
        detailLabel.snp.makeConstraints { (make) in
            make.top.equalTo(imageView.snp.bottom).offset(Dimension.shared.normalMargin)
            make.left.equalToSuperview().offset(Dimension.shared.mediumMargin)
            make.right.equalToSuperview().offset(-Dimension.shared.mediumMargin)
            make.bottom.equalToSuperview().offset(-15)
        }
    }
    
}
