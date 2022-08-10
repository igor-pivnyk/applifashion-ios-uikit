//
//  FooterCollectionReusableView.swift
//  Applifashion
//
//  Created by Dmitry Vinnik on 8/2/22.
//

import UIKit


class FooterCollectionReusableView: UICollectionReusableView {
    static let identifier = "FooterCollectionReusableView"
    

    
    let secondLabel : UILabel = {
        let label = UILabel()
        label.text = "1234"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor.blue
        
        return label
    }()

    let thirdLabel : UILabel = {
        let label = UILabel()
        label.text = "5678"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor.red
        return label
    }()
  
    // First column

    
    static let quickLinks: UILabel = {
        let quickLinks = createPlainLabel(text: "Quick Links", alignment: .left)
        quickLinks.font = UIFont.boldSystemFont(ofSize: 20.0)
        return quickLinks
    }()
    
    static let aboutUs: UILabel = {
        return createPlainLabel(text: "About Us", alignment: .left)
    }()
    
    static let faq: UILabel = {
        return createPlainLabel(text: "FAQ", alignment: .left)
    }()
    
    static let help: UILabel = {
        return createPlainLabel(text: "Help", alignment: .left)
    }()
    
    static let myAccount: UILabel = {
        return createPlainLabel(text: "My Account", alignment: .left)
    }()
    
    static let blog: UILabel = {
        return createPlainLabel(text: "Blog", alignment: .left)
    }()
    
    static let contacts: UILabel = {
        return createPlainLabel(text: "Contacts", alignment: .left)
    }()
    
    
    // Second column
    static let contactsHeading: UILabel = {
        let quickLinks = createPlainLabel(text: "Contacts", alignment: .right)
        quickLinks.font = UIFont.boldSystemFont(ofSize: 20.0)
        return quickLinks
    }()
    
    static let address: UILabel = {
        
        let label = UILabel()
        
        label.numberOfLines = 0;
        label.text = "155 Bovet Rd #600\nSan Mateo, CA 94402"
        label.lineBreakMode = NSLineBreakMode.byWordWrapping;
        label.textColor = .white
        
        return label

    }()
    
    static let addressFull: UIStackView = {
    
        
        let configuration = UIImage.SymbolConfiguration(pointSize: 35)
        let image = UIImage(systemName: "house", withConfiguration: configuration)?.withTintColor(.white, renderingMode: .alwaysOriginal)
        
        let imageView = UIImageView(image: image!)
        
        

        let stackview = UIStackView()
              stackview.axis = .horizontal
              stackview.spacing = 10
              stackview.translatesAutoresizingMaskIntoConstraints = false
              stackview.addArrangedSubview(imageView)
        stackview.addArrangedSubview(address)
        return stackview
        
        
    }()
    
    static let email: UILabel = {
        return createPlainLabel(text: "srd@applitools.com", alignment: .right)

    }()
    
    static let emailFull: UIStackView = {
    
        
        let configuration = UIImage.SymbolConfiguration(pointSize: 40)
        let image = UIImage(systemName: "envelope", withConfiguration: configuration)?.withTintColor(.white, renderingMode: .alwaysOriginal)
        
        let imageView = UIImageView(image: image!)
        
        

        let stackview = UIStackView()
              stackview.axis = .horizontal
              stackview.spacing = 10
              stackview.translatesAutoresizingMaskIntoConstraints = false
              stackview.addArrangedSubview(imageView)
        stackview.addArrangedSubview(email)
        return stackview
        
        
    }()
    
    let leftColumn: UIStackView = {
        let stackview = UIStackView()
              stackview.axis = .vertical
              stackview.spacing = 10
              stackview.translatesAutoresizingMaskIntoConstraints = false
              stackview.addArrangedSubview(quickLinks)
        stackview.addArrangedSubview(aboutUs)
        stackview.addArrangedSubview(faq)
        stackview.addArrangedSubview(help)
        stackview.addArrangedSubview(myAccount)
        stackview.addArrangedSubview(blog)
        stackview.addArrangedSubview(contacts)

        return stackview
    }()
    
    let rightColumn: UIStackView = {
        
        let stackview = UIStackView()
              stackview.axis = .vertical
        
        stackview.spacing = UIStackView.spacingUseSystem
        stackview.isLayoutMarginsRelativeArrangement = true
stackview.layoutMargins = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
//              stackview.spacing = 10
//              stackview.translatesAutoresizingMaskIntoConstraints = false
              stackview.addArrangedSubview(contactsHeading)
        stackview.addArrangedSubview(addressFull)
        stackview.addArrangedSubview(emailFull)
        stackview.addArrangedSubview(UIView())
        stackview.addArrangedSubview(UIView())
        stackview.addArrangedSubview(UIView())
        stackview.addArrangedSubview(UIView())
        stackview.addArrangedSubview(UIView())


        return stackview
    }()

    public func configure() {
        backgroundColor = UIColor(red: 25/255.0, green: 33/255.0, blue: 51/255.0, alpha: 1)
        let stackview = UIStackView()
              stackview.axis = .horizontal
        
        //              stackview.spacing = 10
                stackview.spacing = UIStackView.spacingUseSystem
                stackview.isLayoutMarginsRelativeArrangement = true
        stackview.layoutMargins = UIEdgeInsets(top: 10, left: 20, bottom: 20, right: 20)


              stackview.translatesAutoresizingMaskIntoConstraints = false
              stackview.addArrangedSubview(leftColumn)
//              secondLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
//              secondLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true

              stackview.addArrangedSubview(rightColumn)
//              thirdLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
//              thirdLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true

              addSubview(stackview)
//        stackview.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
//              stackview.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
////        addSubview(test)
//        addSubview(aboutUs)

        
    }

    override func layoutSubviews() {
        super.layoutSubviews()
//        test.frame = bounds
//        aboutUs.frame = bounds

    }
    
    static func createPlainLabel(text: String, alignment: NSTextAlignment) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textColor = .white
        return label
    }
}
