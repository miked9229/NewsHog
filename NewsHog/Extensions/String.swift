//
//  String.swift
//  NewsHog
//
//  Created by Michael Doroff on 11/22/18.
//  Copyright © 2018 Michael Doroff. All rights reserved.
//

import Foundation

extension String {
    
    func toSecureHTTPS() -> String {
        
        return self.contains("https") ? self : self.replacingOccurrences(of: "http", with: "https")
    }

}
