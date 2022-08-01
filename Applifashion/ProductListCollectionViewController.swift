//
//  ProductListCollectionViewController.swift
//  Applifashion
//
//  Created by Dmitry Vinnik on 7/30/22.
//

import UIKit

class ProductListCollectionViewController: UICollectionViewController {

    let dataSource: [String] = ["USA", "Brazil", "USA", "Brazil", "USA", "Brazil", "USA", "Brazil"]
    
    
    let shoes: [Shoe] = [
        Shoe(name: "Appli Air x Night", imageName: "dress_shoes", color: Color.Black, type: ShoeType.Soccer, brand: Brand.Abibas, currentPrice: "$33.00", oldPrice: "$48.00"),
        
        Shoe(name: "Appli ACG React", imageName: "yellow_shoes", color: Color.Yellow, type: ShoeType.Basketball, brand: Brand.Mykey, currentPrice: "$110.00", oldPrice: Shoe.NO_OLD_PRICE),
        
        Shoe(name: "Appli Air Zoom", imageName: "orange_shoes", color: Color.Blue, type: ShoeType.Running, brand: Brand.Bans, currentPrice: "$140.00", oldPrice: Shoe.NO_OLD_PRICE),
        
        Shoe(name: "Appli Air Wild", imageName: "blue_shoes", color: Color.Blue, type: ShoeType.Basketball, brand: Brand.Mykey, currentPrice: "$52.00", oldPrice: "$75.00"),
        
        Shoe(name: "Appli Air Alpha", imageName: "green_shoes", color: Color.Green, type: ShoeType.Running, brand: Brand.Bans, currentPrice: "$170.00", oldPrice: Shoe.NO_OLD_PRICE),
        
        Shoe(name: "Appli Air 98", imageName: "purple_shoes", color: Color.Blue, type: ShoeType.Training, brand: Brand.OverArmour, currentPrice: "$190.00", oldPrice: Shoe.NO_OLD_PRICE),
        
        Shoe(name: "Appli Air 720", imageName: "black_shoes", color: Color.Black, type: ShoeType.Training, brand: Brand.ImBalance, currentPrice: "$200.00", oldPrice: Shoe.NO_OLD_PRICE),

        Shoe(name: "Appli Okwahn II", imageName: "white_shoes", color: Color.White, type: ShoeType.Soccer, brand: Brand.Abibas, currentPrice: "$62.00", oldPrice: "$90.00")
        
    ]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return dataSource.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = UICollectionViewCell()
        
        if let countryCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? CollectionViewCell {
            countryCell.configure(with: dataSource[indexPath.row])
            
            cell = countryCell
        }
        
            
            
        return cell
    }
    

}
