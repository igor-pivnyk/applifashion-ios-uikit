//
//  Shoe.swift
//  Applifashion
//
//  Created by Dmitry Vinnik on 7/31/22.
//

import Foundation
import UIKit

class Shoe {
        
    public static let NO_OLD_PRICE: String = "1"
    
    var imageName: String
    var currentPrice: String
    var currentPriceValue: Int
    var color: Color
    var type: ShoeType
    var brand: Brand
    var oldPrice: String
    var name: String
    
    init(name: String, imageName: String, color: Color, type: ShoeType, brand: Brand, currentPrice: String, oldPrice: String) {
        self.name = name
        self.imageName = imageName;
        self.currentPrice = currentPrice;
        self.color = color;
        self.type = type;
        self.brand = brand;
        self.oldPrice = oldPrice;
        var currentPriceValueString = currentPrice
        
        currentPriceValueString.remove(at: currentPriceValueString.startIndex)
        
        let currentPriceValueDouble = (currentPriceValueString as NSString).doubleValue
        self.currentPriceValue = Int(currentPriceValueDouble)
    }
    
}

