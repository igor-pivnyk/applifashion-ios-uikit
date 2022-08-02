//
//  FooterCollectionReusableView.swift
//  Applifashion
//
//  Created by Dmitry Vinnik on 8/2/22.
//

import UIKit


class FooterCollectionReusableView: UICollectionReusableView {
    static let identifier = "FooterCollectionReusableView"

    
    
    
    let quickLinks: UILabel = {
        let quickLinks = createPlainLabel(text: "Quick Links", alignment: .left)
        quickLinks.font = UIFont.boldSystemFont(ofSize: 16.0)
        return quickLinks
    }()
    
    let aboutUs: UILabel = {
        return createPlainLabel(text: "About Us", alignment: .left)
    }()
    

    public func configure() {
        backgroundColor = UIColor(red: 25/255.0, green: 33/255.0, blue: 51/255.0, alpha: 1)
  
        addSubview(quickLinks)
//        addSubview(aboutUs)

        
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        quickLinks.frame = bounds
//        aboutUs.frame = bounds

    }
    
    static func createPlainLabel(text: String, alignment: NSTextAlignment) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textAlignment = alignment
        label.textColor = .white
        return label
    }
}
