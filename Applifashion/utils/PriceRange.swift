//
//  PriceRange.swift
//  Applifashion
//
//  Created by Dmitry Vinnik on 7/31/22.
//

import Foundation

enum PriceRange {
    case UpTo50
    case UpTo100
    case Upto150
    case UpTo500
    
        var values: (minPrice: Int, maxPrice: Int) {
            switch self {
            case .UpTo50:
                return (0, 50)
            case .UpTo100:
                return (50, 100)
            case .Upto150:
                return (100, 150)
            case .UpTo500:
                return (150, 500)
            }
        }
}
