//
//  NewArticleCell.swift
//  NewsHog
//
//  Created by Michael Doroff on 11/20/18.
//  Copyright © 2018 Michael Doroff. All rights reserved.
//

import UIKit
import SDWebImage

class NewsArticleCell: UICollectionViewCell {

    var article: Article! {
        
        didSet {
            let secureUrlString = article.urlToImage?.toSecureHTTPS() ?? ""
            guard let url = URL(string: secureUrlString) else { return }
            imageView.sd_setImage(with: url, completed: nil)
            imageView.contentMode = .scaleAspectFit
        }
        
    }
    
    let imageView = UIImageView(image: nil)
    
    fileprivate func setupViews() {
        
        let stackView = UIStackView(arrangedSubviews: [imageView])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        
        addSubview(stackView)
        stackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
    }
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
