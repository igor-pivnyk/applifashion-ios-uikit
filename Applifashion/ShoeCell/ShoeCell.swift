//
//  ShoeCell.swift
//  Applifashion
//
//  Created by Dmitry Vinnik on 7/11/22.
//

import UIKit

class ShoeCell: UICollectionViewCell {

    @IBOutlet weak var textLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setData(text: String) {
        self.textLabel.text = text
    }
    

}
