//
//  HeaderCollectionReusableView.swift
//  Applifashion
//
//  Created by Dmitry Vinnik on 8/1/22.
//
import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {
    
    static let identifier = "HeaderCollectionReusableView"
    
    private let filter: UIImageView = {
        let filterImage = UIImage(named: "filter.png")
        let filterView = UIImageView(image: filterImage!)
        filterView.frame = CGRect(x: 380, y: 5, width: 30, height: 30)
        return filterView
    }()
    
    
    
//    let menu: DropDown = {
//        let menu = DropDown()
//        menu.dataSource = [
//            "Popularity",
//            "Average rating",
//            "Newness",
//            "Price: low to high",
//            "Price: high to low"
//        ]
//    }
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "Search and Filter"
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    public func configure() {
        self.layer.cornerRadius = 20
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.black.cgColor
        
        addSubview(label)
        

        addSubview(filter)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = bounds
    }
}


