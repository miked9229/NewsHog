//
//  Article.swift
//  NewsHog
//
//  Created by Michael Doroff on 11/18/18.
//  Copyright © 2018 Michael Doroff. All rights reserved.
//

import UIKit
import FeedKit
import Foundation

class Article: NSObject, Decodable, NSCoding {
    
    func encode(with aCoder: NSCoder) {

        aCoder.encode(author ?? "", forKey: "authorNameKey")
        aCoder.encode(title ?? "", forKey: "titleNameKey")
        aCoder.encode(url ?? "", forKey: "urlKey")
        aCoder.encode(urlToImage, forKey: "urlToImageKey")
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        self.author = aDecoder.decodeObject(forKey: "authorNameKey") as? String
        self.title = aDecoder.decodeObject(forKey: "titleNameKey") as? String
        self.url = aDecoder.decodeObject(forKey: "urlKey") as? String
        self.urlToImage = aDecoder.decodeObject(forKey: "urlToImageKey") as? String
        self.publishedAt = aDecoder.decodeObject(forKey: "publishedAtKey") as? String
        self.content = aDecoder.decodeObject(forKey: "contentKey") as? String
        
    }
    let author: String?
    let title: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
    
    
    
}
