//
//  ViewController.swift
//  DemoApp
//
//  Created by admin on 4/11/1398 AP.
//  Copyright © 1398 admin. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ArticleViewController: BaseViewController {
    
    fileprivate var article: [ArticlesModel] = []
    
    // MARK: - UIElements
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ItemTableViewCell.self, forCellReuseIdentifier: ItemTableViewCell.itemId)
        return tableView
    }()
    
    // MARK: - ViewLifeCycle
    
    override func initialize() {
        super.initialize()
        setupNavigationBar()
        fetchData()
        layoutTableView()
    }
    
    // MARK: - Request API
    
    func fetchData(){
        // Other thread -> main thread
        // Update UI have to do on mainthread -> crash
        // Task nặng -> nếu thực hiện mainthread sẽ block -> đứng treo app
        //
        guard let url = URL(string: "https://moneyforwardvietnam.github.io/example-feed/feed.json") else { return }
        
        // HTTP method: GET - POST - PUT - DELETE
        // Nhap du lieu -> POST -> Create SQL
        // GET -> SELECT
        
        // Request Timeout: connect server -> truy van -> Đợi lúc nào đó mình ko lắng nghe -> trả về lỗi
        // Cache Policy: Cache -> Memmory -> tắt app sẽ mất, cache disk tắt app vẫn còn. // Tốc độ truy xuâtdisk chậm hơn
        // Tốn chi phí I/O
        // URLRequest: native API apple có support
        
        // URLRequest == URLConvertible
        
//        let urlRequest = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 3.0)
        
        let dataRequest = Alamofire.request(url,
                                            method: .get,
                                            parameters: nil,
                                            encoding: URLEncoding.queryString,
                                            headers: nil)
        
        dataRequest.responseJSON { (response) in // simple
            switch response.result {
            case .success(let value):
                let jason = JSON(value)
                self.article = jason["articles"].arrayValue.map { ArticlesModel(json: $0) }
                self.tableView.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    // MARK: - SetupView
    func setupNavigationBar() {
        navigationItem.title = "Articles"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.darkGray,
                                                                   NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20)]
    }
    
    func layoutTableView() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(self.view)
        }
    }
    
}

// MARK: - UITableViewDelegate

extension ArticleViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let newVC = DetailViewController()
        newVC.setupDataDetail(data: article[indexPath.row])
        self.navigationController?.pushViewController(newVC, animated: true)
        
    }
}


// MARK: - UITableViewDataSource

extension ArticleViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return article.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ItemTableViewCell.itemId, for: indexPath) as? ItemTableViewCell else {
            return UITableViewCell()
        }
        cell.setupItemCell(articles: article[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return ItemTableViewCell.caculteCellHeight(by: article[indexPath.row].description)
    }
}
