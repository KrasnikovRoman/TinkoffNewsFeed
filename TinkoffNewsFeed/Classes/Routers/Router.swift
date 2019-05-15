//
//  Router.swift
//  TinkoffNewsFeed
//
//  Created by roman on 15/05/2019.
//  Copyright © 2019 roman. All rights reserved.
//

import UIKit

class Router {
    static let shared = Router()
    private let rootViewController: UIViewController = FeedViewController()
    
    private init() {}
    
    func routeToRootViewController(_ window: inout UIWindow?) {
        let frame = UIScreen.main.bounds
        window = UIWindow(frame: frame)
        window?.makeKeyAndVisible()
        window?.rootViewController = UINavigationController(rootViewController: rootViewController)
    }
    
    func routeToExtraDetailViewController(from source: UIViewController) {
        let extraDetailViewController = ExtraDetailViewController()
        source.navigationController?.pushViewController(extraDetailViewController, animated: true)
    }
}
