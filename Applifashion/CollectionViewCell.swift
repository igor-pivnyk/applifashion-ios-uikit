//
//  CollectionViewCell.swift
//  Applifashion
//
//  Created by Dmitry Vinnik on 7/31/22.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var countryNameLabel: UILabel!
    
    func configure(with countryName: String) {
        countryNameLabel.text = countryName
    }
}
