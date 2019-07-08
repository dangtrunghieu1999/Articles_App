//
//  DetailViewController.swift
//  DemoApp
//
//  Created by admin on 4/11/1398 AP.
//  Copyright © 1398 admin. All rights reserved.
//

import UIKit

class DetailViewController: BaseViewController {
    // MARK: - Proterties
    
    lazy var contentViewSize = CGSize(width: self.view.frame.width, height: self.view.frame.height)
    private static let margin_5:    CGFloat = 5.0
    private static let margin_10:   CGFloat = 10.0
    private static let imageWidth:  CGFloat = 150
    
    // MARK: - UIElements
    
    lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentSize = contentViewSize
        return view
    }()
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.frame.size = contentViewSize
        return view
    }()
    let logoImage: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 75
        image.clipsToBounds = true
        image.layer.masksToBounds = true
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let detailLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: label.font.fontName, size: 14)
        label.numberOfLines = 0
        return label
    }()
    
    // MARK: - ViewLifeCycle
    override func initialize() {
        super.initialize()
        layoutLogoImage()
        layoutDetailImage()
        layoutScrollView()
    }
    
    // MARK: - SetupDataView
    func setupDataDetail(data: ArticlesModel ){
        detailLabel.text = data.detail
        logoImage.loadImageUsingUrlString(urlString: data.image)
    }
    
    
    // MARK: - Layout
    func layoutScrollView() {
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        scrollView.addSubview(containerView)
    }
    func layoutLogoImage() {
        containerView.addSubview(logoImage)
        logoImage.snp.makeConstraints { (make) in
            make.width.height.equalTo(DetailViewController.imageWidth)
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(DetailViewController.margin_10)
        }
    }
    
    func layoutDetailImage() {
        containerView.addSubview(detailLabel)
        detailLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(DetailViewController.margin_5)
            make.right.equalToSuperview().offset(-DetailViewController.margin_5)
            make.top.equalTo(logoImage.snp.bottom).offset(DetailViewController.margin_5)
        }
    }
    
}
