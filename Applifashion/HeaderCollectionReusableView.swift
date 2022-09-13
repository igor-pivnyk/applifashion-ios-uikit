//
//  HeaderCollectionReusableView.swift
//  Applifashion
//
//  Created by Dmitry Vinnik on 8/1/22.
//
import UIKit
import DropDown

class HeaderCollectionReusableView: UICollectionReusableView {
    
    static let identifier = "HeaderCollectionReusableView"
    
    private let filter: UIImageView = {
        
        let filterImage = UIImage(named: "filter.png")
     
        let filterView = UIImageView(image: filterImage!)
        filterView.accessibilityIdentifier = "filterImage"
        return filterView
    }()
    
    let menu: DropDown = {
        let menu = DropDown()
        menu.dataSource = [
            "Popularity",
            "Average rating",
            "Newness",
            "Price: low to high",
            "Price: high to low"
        ]
        
        menu.frame = CGRect(x: 10, y: 5, width: 70, height: 30)
        menu.accessibilityIdentifier = "menuDropDown"
        return menu
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "  Sort By"
        label.textAlignment = .left
        label.textColor = .black
        label.accessibilityIdentifier = "sortByLabel"
        return label
    }()
    
    let dropDownView: UIView = {
        let dropDownView = UIView()
        dropDownView.frame = CGRect(x: 100, y: 5, width: 150, height: 30)
        dropDownView.accessibilityIdentifier = "menuDropDownView"
        return dropDownView
    }()

    private let sortByButton: UIButton = {
        let sortByButton = UIButton()
        sortByButton.setTitle("Sort By", for: .normal)
        sortByButton.setTitleColor(.black, for: .normal)
        
        let configuration = UIImage.SymbolConfiguration(pointSize: 10)
                                             
        sortByButton.setImage(UIImage(systemName: "chevron.down", withConfiguration: configuration)?.withTintColor(.black, renderingMode: .alwaysOriginal), for: .normal)
        sortByButton.frame = CGRect(x: 10, y: 5, width: 100, height: 30)
        sortByButton.addTarget(self, action: #selector(showSortByOptions), for: .touchUpInside)
        sortByButton.accessibilityIdentifier = "sortByButton"
        return sortByButton
    }()
    
    public func configure() {
        self.layer.cornerRadius = 20
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.black.cgColor
        
        addSubview(sortByButton)
        addSubview(dropDownView)
        filter.frame = CGRect(x: self.frame.width - 50, y: 5, width: 30, height: 30)
        addSubview(filter)
    }
    
    @objc func showSortByOptions(_ sender: Any) {
        menu.anchorView = dropDownView
        menu.show()
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = bounds
    }
}

