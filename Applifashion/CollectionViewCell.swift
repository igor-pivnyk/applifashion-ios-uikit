//
//  CollectionViewCell.swift
//  Applifashion
//
//  Created by Dmitry Vinnik on 7/31/22.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var discount: UIImageView!
    @IBOutlet private weak var oneDayLeft: UIImageView!
    
    @IBOutlet private weak var currentPrice: UILabel!
    @IBOutlet private weak var shoeImage: UIImageView!
    @IBOutlet private weak var oldPrice: UILabel!
    @IBOutlet private weak var shoeName: UILabel!

    func configure(with shoeName: String,
                   with currentPrice: String,
                   with oldPrice: String,
                   with shoeImage: UIImage) {
        self.shoeName.text = shoeName
        self.shoeImage.image = shoeImage
        self.currentPrice.text = currentPrice
        if oldPrice == Shoe.NO_OLD_PRICE {
            self.oldPrice.isHidden = true
            self.oneDayLeft.isHidden = true
            self.discount.isHidden = true
            self.currentPrice.textAlignment = .center
        } else {
            self.oldPrice.isHidden = false
            self.oneDayLeft.isHidden = false
            self.discount.isHidden = false
            self.currentPrice.textAlignment = .left

            let attributeString: NSMutableAttributedString = NSMutableAttributedString(string: oldPrice)
                attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSRange(location: 0, length: attributeString.length))
            self.oldPrice.attributedText = attributeString

            
            
            
//            self.oldPrice.text = oldPrice
        }
        
//        self.shoeImage.image = 

    
    }
}
