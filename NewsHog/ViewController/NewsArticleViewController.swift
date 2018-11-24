//
//  NewsArticleViewController.swift
//  NewsHog
//
//  Created by Michael Doroff on 11/20/18.
//  Copyright © 2018 Michael Doroff. All rights reserved.
//

import UIKit


class NewArticlesViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let cellid = "cellid"
    var newsArticles = [Article]()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        retrieveNewsArticles()
        
    }
    
    override func viewDidLoad() {
        
        setupCollectionView()
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellid, for: indexPath) as! NewsArticleCell
        
        cell.article = newsArticles[indexPath.item]
        
        return cell
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return newsArticles.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        let width = (view.frame.width - 3 * 25)
        print(width)
        return CGSize(width: width, height: width + 16)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
    

    public func setupCollectionView() {
        
        collectionView.backgroundColor = .white
        collectionView.register(NewsArticleCell.self, forCellWithReuseIdentifier: cellid)
        
    }
    
    fileprivate func retrieveNewsArticles() {
        
        APIService.shared.fetchNews { (articles) in
            
            
            self.newsArticles = self.processNewsArticles(articles: articles)
            self.collectionView.reloadData()
        }
        
    }
    
    fileprivate func processNewsArticles(articles: [Article]) -> [Article] {
        
        var finalArticles = [Article]()
        
        articles.forEach { (art) in
            if art.urlToImage != nil {
                
                finalArticles.append(art)
            }
        }
        
        return finalArticles
    }
    
}
