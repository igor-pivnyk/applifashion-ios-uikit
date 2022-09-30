//
//  ProductListCollectionViewController.swift
//  Applifashion
//
//  Created by Dmitry Vinnik on 7/30/22.
//

import UIKit

class ProductListCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    static let identifier = "ProductListCollectionViewController"
    
    var brands = [Brand]()
    var colors = [Color]()
    var priceRanges = [PriceRange]()
    var types = [ShoeType]()

    var dataSource: [Shoe] = [Shoe]()
    
    let originalShoes: [Shoe] = [
        Shoe(name: "Appli Air x Night", imageName: "dress_shoes", color: Color.Black, type: ShoeType.Soccer, brand: Brand.Abibas, currentPrice: "$33.00", oldPrice: "$48.00"),
        
        Shoe(name: "Appli ACG React", imageName: "yellow_shoes", color: Color.Yellow, type: ShoeType.Basketball, brand: Brand.Mykey, currentPrice: "$110.00", oldPrice: Shoe.NO_OLD_PRICE),
        
        Shoe(name: "Appli Air Zoom", imageName: "orange_shoes", color: Color.Blue, type: ShoeType.Running, brand: Brand.Bans, currentPrice: "$140.00", oldPrice: Shoe.NO_OLD_PRICE),
        
        Shoe(name: "Appli Air Wild", imageName: "blue_shoes", color: Color.Blue, type: ShoeType.Basketball, brand: Brand.Mykey, currentPrice: "$52.00", oldPrice: "$75.00"),
        
        Shoe(name: "Appli Air Alpha", imageName: "green_shoes", color: Color.Green, type: ShoeType.Running, brand: Brand.Bans, currentPrice: "$170.00", oldPrice: Shoe.NO_OLD_PRICE),
        
        Shoe(name: "Appli Air 98", imageName: "purple_shoes", color: Color.Blue, type: ShoeType.Training, brand: Brand.OverArmour, currentPrice: "$190.00", oldPrice: Shoe.NO_OLD_PRICE),
        
        Shoe(name: "Appli Air 720", imageName: "black_shoes", color: Color.Black, type: ShoeType.Training, brand: Brand.ImBalance, currentPrice: "$200.00", oldPrice: Shoe.NO_OLD_PRICE),

        Shoe(name: "Appli Okwahn II", imageName: "white_shoes", color: Color.White, type: ShoeType.Soccer, brand: Brand.Abibas, currentPrice: "$62.00", oldPrice: "$90.00")
        
    ]
    
    func filterShoes() {
        
        
        if brands.isEmpty
            && colors.isEmpty
            && priceRanges.isEmpty
            && types.isEmpty {
            dataSource = originalShoes.map { $0.copy() as! Shoe }
        }
        
        for shoe in originalShoes {
            
            if (brands.isEmpty || brands.contains(shoe.brand))
                && (colors.isEmpty || colors.contains(shoe.color))
                && (priceRanges.isEmpty || isWithinPriceRange(shoe: shoe))
                && (types.isEmpty || types.contains(shoe.type)) {
                dataSource.append(shoe)
            }
        }
    }
    
    
    func isWithinPriceRange(shoe: Shoe) -> Bool {
        for priceRange in priceRanges {
            if (priceRange.values.minPrice <=  shoe.currentPriceValue
                && shoe.currentPriceValue <=  priceRange.values.maxPrice) {
                return true
            }
        }
        return false
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        filterShoes()
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
              layout.sectionInset = UIEdgeInsets(top: 28, left: 0, bottom: 10, right: 0)
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
            let shoe: Shoe = dataSource[indexPath.row]
            shoeCell.configure(with: shoe.name, with: shoe.currentPrice, with: shoe.oldPrice, with:  UIImage(named:shoe.imageName)!)
            
            cell = shoeCell
        }
            
            
        return cell
    }
    
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        collectionView?.collectionViewLayout.invalidateLayout()
        collectionView?.reloadData()

    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionFooter {
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: FooterCollectionReusableView.identifier, for: indexPath) as! FooterCollectionReusableView
            
            footer.configure()
            return footer
        } else {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView.identifier, for: indexPath) as! HeaderCollectionReusableView
            
            header.configure()
            filterButton.frame = CGRect(x: self.view.frame.width - 50, y: 5, width: 30, height: 30)
            header.addSubview(filterButton)
            
            let extraLine = UIView(frame: CGRect(x: 0, y: 40, width: UIScreen.main.bounds.width, height: 8))
                        extraLine.backgroundColor = .systemGray
                        header.addSubview(extraLine)
            return header

        }
        
       
    }
    
    
    private let filterButton: UIButton = {
        let filterButton = UIButton()

        filterButton.addTarget(self, action: #selector(imageTap), for: .touchUpInside)
        filterButton.accessibilityIdentifier = "filterButton"

        return filterButton
    }()
    
    
    
    @objc func imageTap() {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: FilterViewController.identifier) as? FilterViewController
        self.navigationController?.pushViewController(vc!, animated: true)
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: ShoeDetailViewController.identifier) as? ShoeDetailViewController
        let shoe = dataSource[indexPath.row]
        // do something vc
        vc?.oldPriceValue = shoe.oldPrice
        vc?.currentPriceValue = shoe.currentPrice
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
        var numberOfColumns = 2.0
        if UIDevice.current.orientation.isLandscape {
            numberOfColumns = 3.0
        }
        let size:CGFloat = (collectionView.frame.size.width - space) / numberOfColumns

        
        return CGSize(width: size, height: size)
    }

}
