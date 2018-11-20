//
//  ViewController.swift
//  NewsHog
//
//  Created by Michael Doroff on 11/5/18.
//  Copyright © 2018 Michael Doroff. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    var newsArticles = [Article]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        
        APIService.shared.fetchNews { (articles) in
            
            self.newsArticles = articles
            self.goThroughArticles()
        }
        
       
        
    }
    
    public func goThroughArticles() {
        
        newsArticles.forEach { (art) in
            print(art.urlToImage)
            print(art.author)
            print(art.source)
        }
    }
    
    


}

