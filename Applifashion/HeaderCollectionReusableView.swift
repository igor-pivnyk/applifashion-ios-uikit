//
//  HeaderCollectionReusableView.swift
//  Applifashion
//
//  Created by Dmitry Vinnik on 8/1/22.
//
import UIKit
import DropDown

class HeaderCollectionReusableView: UICollectionReusableView {
    
    static let identifier = "HeaderCollectionReusableView"
    
//    private let filterButton: UIButton = {
//        let filterButton = UIButton()
//        filterButton.backgroundColor = .red
////        filterButton.setTitle("Sort By", for: .normal)
////        sortByButton.setTitleColor(.black, for: .normal)
//        filterButton.frame = CGRect(x: 380, y: 5, width: 70, height: 30)
//        filterButton.addTarget(self, action: #selector(imageTap), for: .touchUpInside)
//
//        return filterButton
//    }()
    
    private let filter: UIImageView = {
        
        let filterImage = UIImage(named: "filter.png")
     
        let filterView = UIImageView(image: filterImage!)
        
     
//
//
//        filterView.isUserInteractionEnabled = true
//        filterView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(imageTap)))
//
        filterView.frame = CGRect(x: 380, y: 5, width: 30, height: 30)
        return filterView
    }()
//    
//    @objc func imageTap() {
//        print("test")
//        
////
////        let storyboard = UIStoryboard(name: "Main",  bundle: nil)
////        let aaaVC = storyboard.instantiateViewController(withIdentifier: FilterController.identifier) as! FilterController
////           self.navigationController?.pushViewController(aaaVC, animated: true)
//        
//        
////        self.present(FilterController())
////           // or push to the navigation stack
////           self.navigationController?.push(FilterController())
////
////        let vc = self.storyboard?.instantiateViewController(withIdentifier: FilterController.identifier) as? FilterController
////
////        self.navigationController?.pushViewController(vc!, animated: true)
////
////        // present modally
////        self.present(FilterController())
////        // or push to the navigation stack
////        self.navigationController?.push(FilterController())
////
//    }
    
    
//     let dropDown = DropDown() //2
//
//
//     @IBAction func tapChooseMenuItem(_ sender: UIButton) {//3
//       dropDown.dataSource = ["Tomato soup", "Mini burgers", "Onion rings", "Baked potato", "Salad"]//4
//       dropDown.anchorView = sender //5
//       dropDown.bottomOffset = CGPoint(x: 0, y: sender.frame.size.height) //6
//       dropDown.show() //7
//       dropDown.selectionAction = { [weak self] (index: Int, item: String) in //8
//         guard let _ = self else { return }
//         sender.setTitle(item, for: .normal) //9
//       }
//     }
    
    let menu: DropDown = {
        let menu = DropDown()
        menu.dataSource = [
            "Popularity",
            "Average rating",
            "Newness",
            "Price: low to high",
            "Price: high to low"
        ]
        
        menu.frame = CGRect(x: 10, y: 5, width: 70, height: 30)
//        menu.frame = CGRect(x: 0, y: 5, width: 30, height: 30)

        return menu
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "  Sort By"
        label.textAlignment = .left
        label.textColor = .black
//        let viewWidth = self.view.frame.width
//        let viewHeight = self.view.frame.height
////        let button = UIButton(frame: CGRect(x: viewWidth - 60,y:20,height:30,width: 40))
       
        return label
    }()
    
    
    
    let dropDownView: UIView = {
        let dropDownView = UIView()
        dropDownView.frame = CGRect(x: 100, y: 5, width: 150, height: 30)
       
//        image.frame = CGRect(x: -10, y: 10, width: 15, height: 10)
//        dropDownView.addSubview(image)
                                        
        return dropDownView
    }()

    private let sortByButton: UIButton = {
        let sortByButton = UIButton()
        sortByButton.setTitle("Sort By", for: .normal)
        sortByButton.setTitleColor(.black, for: .normal)
        
        let configuration = UIImage.SymbolConfiguration(pointSize: 10)
//        let buttonImage: UIImageView = UIImageView(image: UIImage(systemName: "chevron.down", withConfiguration: configuration)?.withTintColor(.black, renderingMode: .alwaysOriginal))
                                             
        sortByButton.setImage(UIImage(systemName: "chevron.down", withConfiguration: configuration)?.withTintColor(.black, renderingMode: .alwaysOriginal), for: .normal)
        sortByButton.frame = CGRect(x: 10, y: 5, width: 100, height: 30)
        sortByButton.addTarget(self, action: #selector(showSortByOptions), for: .touchUpInside)

        return sortByButton
    }()
    
    public func configure() {
        self.layer.cornerRadius = 20
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.black.cgColor
        
//        let stackview = UIStackView()
////        stackview.layer.cornerRadius = 20
////        stackview.layer.borderWidth = 2
////        stackview.layer.borderColor = UIColor.black.cgColor
////        stackview.frame = CGRect(x: 380, y: 5, width: 30, height: 30)
////        stackview.layer
//              stackview.axis = .horizontal
////        stackview.isLayoutMarginsRelativeArrangement = true
////stackview.layoutMargins = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
//              stackview.spacing = 10
//              stackview.translatesAutoresizingMaskIntoConstraints = false
//              stackview.addArrangedSubview(label)
//        stackview.addArrangedSubview(filter)
        
        
        
        
//        menu.anchorView = dropDown
        
//        addSubview(menu)
        
//        let button = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 50))
//        button.backgroundColor = .green
//        button.setTitle("Test Button", for: .normal)
//        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)

        addSubview(sortByButton)
        addSubview(dropDownView)


        addSubview(filter)


//        addSubview(stackview)

    }
    
    
    @objc func showSortByOptions(_ sender: Any) {
        
        menu.anchorView = dropDownView
        menu.show()
    }
 
    @objc func show(sender: UIButton!) {
      print("Button tapped")
    }
    
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = bounds
    }
}


