//
//  TabBarViewController.swift
//  NewsHog
//
//  Created by Michael Doroff on 11/19/18.
//  Copyright © 2018 Michael Doroff. All rights reserved.
//

import UIKit

//MARK:- MainTabBarViewController: UITabBarController

class MainTabBarViewController: UITabBarController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UINavigationBar.appearance().prefersLargeTitles = true
        tabBar.tintColor = .blue
    
    
        setupViewControllers()
    
    }
    
    public func setupViewControllers() {
        
        let layout = UICollectionViewFlowLayout()
        
        let newsArticlesController = NewArticlesViewController(collectionViewLayout: layout)
        
        viewControllers = [
            generateNavigationController(with: newsArticlesController, title: "", image: nil)
        
        ]
        
    }
    
    //MARK:- Helper Functions
    
    fileprivate func generateNavigationController(with rootViewController: UIViewController, title: String, image: UIImage?) -> UIViewController {
        
        let navController = UINavigationController(rootViewController: rootViewController)
        rootViewController.navigationItem.title = title
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        return navController
        
    }
    
}
