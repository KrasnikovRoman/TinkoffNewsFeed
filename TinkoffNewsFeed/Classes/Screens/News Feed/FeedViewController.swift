//
//  ViewController.swift
//  TinkoffNewsFeed
//
//  Created by roman on 15/05/2019.
//  Copyright © 2019 roman. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {
    private let refreshControl = UIRefreshControl()
    
    @IBOutlet weak var tableView: UITableView!
    
    private var news: [String] = ["asdasdaasdasdasssdadasdasdasdadasdsadadsadsadadasdadsadasdadadadadasdas", "asdadasd"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        setupTableView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = #colorLiteral(red: 0.1176470588, green: 0.1176470588, blue: 0.1843137255, alpha: 1)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 76
    }
    
    private func registerCells() {
        tableView.register(SingleNewsTableViewCell.nib, forCellReuseIdentifier: SingleNewsTableViewCell.name)
    }
    
    private func setupRefreshControl() {
        if #available(iOS 10.0, *) {
            tableView.refreshControl = refreshControl
        } else {
            tableView.addSubview(refreshControl)
        }
        refreshControl.addTarget(self, action: #selector(pulledToRefresh), for: .valueChanged)
    }

}

// MARK: - Actions and logics
extension FeedViewController {
    @objc private func pulledToRefresh() {
//        NetworkService.shared.fetchNews { [unowned self] (articles, error) in
//            if let _ = error {
//
//                // Обработать ошибку
//                DispatchQueue.main.async {
//                    self.stopRefreshing()
//                }
//            } else {
//                DispatchQueue.main.async {
//                    //                    self.articles.append(contentsOf: articles!)
//                    //                    self.tableView.reloadData()
//                    //                    self.stopRefreshing()
//                }
//
//            }
        }
    }
    
//    private func stopRefreshing() {
//        if refreshControl.isRefreshing {
//            refreshControl.endRefreshing()
//        }
//    }

extension FeedViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // TODO: Pass needed data here
        Router.shared.routeToExtraDetailViewController(from: self)
    }
}

extension FeedViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: SingleNewsTableViewCell.name, for: indexPath) as? SingleNewsTableViewCell {
            cell.titleLabel.text = news[indexPath.row]
            cell.viewedCountLabel.text = "Просмотрено: 0"
            return cell
        }
        
        return UITableViewCell()
    }
    
    
}
