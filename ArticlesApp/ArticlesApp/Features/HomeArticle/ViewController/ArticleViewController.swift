//
//  ArticleViewController.swift
//  ArticlesApp
//
//  Created by DangTrungHieu on 4/10/20.
//  Copyright © 2020 DangTrungHieu. All rights reserved.
//

import UIKit

class ArticleViewController: BaseViewController {
    
    // MARK: - Variables
    fileprivate lazy var articles: [Article] = []
    
    
    // MARK: - Properties
    
    // MARK: - UI Elements
    
    fileprivate lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .white
        collectionView.registerReusableCell(ArticleCollectionViewCell.self)
        return collectionView
    }()
    
    
    // MARK: - ViewLifeCycles
    
    override func initialize() {
        super.initialize()
        
        navigationItem.title = "Article App"
        layoutCollectionView()
        requestAPIArticles()
    }
    
    // MARK: - Helper Method
    
    fileprivate func requestAPIArticles() {
        let endPoint = ArticleEndPoint.getAllHome
        
        APIService.request(endPoint: endPoint, onSuccess: { [weak self](apiResponse) in
            self?.articles = apiResponse.toArray([Article.self])
            self?.reloadDataWhenFinishLoadAPI()
            }, onFailure: { (apiError) in
                print("error")
        }) {
            print("error")
        }
    }
    
    private func reloadDataWhenFinishLoadAPI() {
        self.collectionView.reloadData()
    }
    
    // MARK: - Public Method
    
    // MARK: - Layout
    
    private func layoutCollectionView(){
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { (make) in
            make.bottom.left.right.equalToSuperview()
            if #available(iOS 11, *) {
                make.top.equalTo(view.safeAreaLayoutGuide)
            } else {
                make.top.equalTo(topLayoutGuide.snp.bottom)
            }
        }
    }
    
}

// MARK: - UICollectionViewDelegateFlowLayout

extension ArticleViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width
        return CGSize(width: width, height: 120)
    }
}

// MARK: - UICollectionViewDataSource

extension ArticleViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return articles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: ArticleCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
        cell.configCell(by: articles[indexPath.row])
        return cell
    }
}

// MARK: - UICollectionViewDelegate

extension ArticleViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = DetailArticleViewController()
        vc.configData(by: articles[indexPath.row])
        navigationController?.pushViewController(vc, animated: true)
    }
}

