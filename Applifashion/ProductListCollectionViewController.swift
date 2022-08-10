//
//  ProductListCollectionViewController.swift
//  Applifashion
//
//  Created by Dmitry Vinnik on 7/30/22.
//

import UIKit

class ProductListCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    


    
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
        
//        let layout = UICollectionViewFlowLayout()
//        layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
              layout.sectionInset = UIEdgeInsets(top: 20, left: 0, bottom: 10, right: 0)
              layout.minimumInteritemSpacing = 0
              layout.minimumLineSpacing = 0
              collectionView!.collectionViewLayout = layout
        
        collectionView?.register(HeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView.identifier)
        collectionView?.register(FooterCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: FooterCollectionReusableView.identifier)

    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return dataSource.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = UICollectionViewCell()
        
        if let shoeCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? CollectionViewCell {
            var shoe: Shoe = shoes[indexPath.row]
            shoeCell.configure(with: shoe.name, with: shoe.currentPrice, with: shoe.oldPrice, with:  UIImage(named:shoe.imageName)!)
            
            cell = shoeCell
        }
            
            
        return cell
    }
    
    
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionFooter {
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: FooterCollectionReusableView.identifier, for: indexPath) as! FooterCollectionReusableView
            
            footer.configure()
            return footer
        } else {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView.identifier, for: indexPath) as! HeaderCollectionReusableView
            
            header.configure()
            return header

        }
       
    }
    
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: ShoeDetailViewController.identifier) as? ShoeDetailViewController
        let shoe = shoes[indexPath.row]
        // do something vc
        vc?.shoeName = shoe.name;
        vc?.shoeImage = UIImage(named:shoe.imageName)!
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.size.width, height: 40)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.size.width, height: 230)

    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let flowayout = collectionViewLayout as? UICollectionViewFlowLayout
        let space: CGFloat = (flowayout?.minimumInteritemSpacing ?? 0.0) + (flowayout?.sectionInset.left ?? 0.0) + (flowayout?.sectionInset.right ?? 0.0)
        let size:CGFloat = (collectionView.frame.size.width - space) / 2.0
        
        return CGSize(width: size, height: size)
    }
    

}
