//
//  ProductListCollectionViewController.swift
//  Applifashion
//
//  Created by Dmitry Vinnik on 7/30/22.
//

import UIKit

class ProductListCollectionViewController: UICollectionViewController {

    let dataSource: [String] = ["USA", "Brazil", "USA", "Brazil", "USA", "Brazil", "USA", "Brazil"]
    
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
