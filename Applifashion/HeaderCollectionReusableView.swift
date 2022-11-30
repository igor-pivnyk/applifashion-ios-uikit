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
    
    private lazy var filter: UIImageView = {
        
        let filterImage = UIImage(named: "filter.png")
     
        let filterView = UIImageView(image: filterImage!)
        filterView.translatesAutoresizingMaskIntoConstraints = false
        filterView.accessibilityIdentifier = "filterImage"
        return filterView
    }()
    
    lazy var menu: DropDown = {
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
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = "  Sort By"
        label.textAlignment = .left
        label.textColor = .black
        label.accessibilityIdentifier = "sortByLabel"
        return label
    }()
    
    lazy var dropDownView: UIView = {
        let dropDownView = UIView()
        dropDownView.translatesAutoresizingMaskIntoConstraints = false
        dropDownView.accessibilityIdentifier = "menuDropDownView"
        return dropDownView
    }()

    private lazy var sortByButton: UIButton = {
        let sortByButton = UIButton()
        sortByButton.setTitle("Sort By", for: .normal)
        sortByButton.setTitleColor(.black, for: .normal)
        sortByButton.translatesAutoresizingMaskIntoConstraints = false
        let configuration = UIImage.SymbolConfiguration(pointSize: 10)
                                             
        sortByButton.setImage(UIImage(systemName: "chevron.down", withConfiguration: configuration)?.withTintColor(.black, renderingMode: .alwaysOriginal), for: .normal)
//        sortByButton.frame = CGRect(x: 10, y: 5, width: 100, height: 30)
        sortByButton.addTarget(self, action: #selector(showSortByOptions), for: .touchUpInside)
        sortByButton.accessibilityIdentifier = "sortByButton"
        return sortByButton
    }()
    
    public func configure() {
        self.layer.cornerRadius = 20
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.black.cgColor
        
        addSubview(sortByButton)
        NSLayoutConstraint.activate([
            sortByButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            sortByButton.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            sortByButton.widthAnchor.constraint(equalToConstant: 100),
            sortByButton.heightAnchor.constraint(equalToConstant: 30)
        ])
        addSubview(dropDownView)
        NSLayoutConstraint.activate([
            dropDownView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 100),
            dropDownView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            dropDownView.widthAnchor.constraint(equalToConstant: 150),
            dropDownView.heightAnchor.constraint(equalToConstant: 30)
        ])
//        filter.frame = CGRect(x: self.frame.width - 50, y: 5, width: 30, height: 30)
        addSubview(filter)
        NSLayoutConstraint.activate([
            filter.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            filter.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            filter.widthAnchor.constraint(equalToConstant: 30),
            filter.heightAnchor.constraint(equalToConstant: 30)
        ])
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

