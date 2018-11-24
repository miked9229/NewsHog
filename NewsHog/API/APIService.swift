//
//  APIService.swift
//  NewsHog
//
//  Created by Michael Doroff on 11/20/18.
//  Copyright © 2018 Michael Doroff. All rights reserved.
//

import Foundation
import Foundation
import Alamofire
import FeedKit


//MARK:- APIService

class APIService {
    
    //singelton
    
    static let shared = APIService()

    let APIKey = "f27912d79dda46b98e7bea0b2c3227ec"
    let newsFeedUrl = "https://newsapi.org/v2/"
    let topHeadlinesNewsFeedUrl = "https://newsapi.org/v2/top-headlines"
    
    public func fetchNews(completionHandler: @escaping ([Article]) -> ()) {
        
        let parameters = ["apiKey": APIKey, "country": "us"]
        
        print("Trying to fetch data from News API....")
        
        Alamofire.request(topHeadlinesNewsFeedUrl, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseData { (dataResponse) in
            
            if let err = dataResponse.error {
                print("failed to return data from the News API,", err)
                return
                
            }
            
            guard let data = dataResponse.data else { return }
            
            do {
                
                let searchResults = try JSONDecoder().decode(SearchResults.self, from: data)
                completionHandler(searchResults.articles)
                
            } catch let decodeErr {
                
                print("failed to decode:", decodeErr)
            }
            
            
        }
        
        struct SearchResults: Decodable {
            
            let totalResults: Int
            let articles: [Article]
            
        }
        
    }
    
}
