//
//  FilterViewController.swift
//  Applifashion
//
//  Created by Dmitry Vinnik on 8/12/22.
//

import UIKit

class FilterViewController: UIViewController {
    static let identifier = "FilterViewController"
    
    @IBOutlet weak var scrollView: UIScrollView!
    // Types
    @IBOutlet weak var soccerTypeButton: UIButton!
    
    @IBOutlet weak var basketballTypeButton: UIButton!
    
    @IBOutlet weak var runningTypeButton: UIButton!
    
    @IBOutlet weak var trainingTypeButton: UIButton!
    
    // Colors
    
    @IBOutlet weak var blackColorButton: UIButton!
    
    @IBOutlet weak var whiteColorButton: UIButton!
    
    @IBOutlet weak var blueColorButton: UIButton!
    
    @IBOutlet weak var yellowColorButton: UIButton!
    
    @IBOutlet weak var greenColorButton: UIButton!
    
    // Brands
    @IBOutlet weak var abibasBrandButton: UIButton!
    
    @IBOutlet weak var mykeyBrandButton: UIButton!
    
    @IBOutlet weak var bansBrandButton: UIButton!
    
    @IBOutlet weak var overArmoudBrandButton: UIButton!
    
    @IBOutlet weak var imbalanceBrandButton: UIButton!
    
    // Prices
    @IBOutlet weak var upToFiftyButton: UIButton!
    
    @IBOutlet weak var upTo100Button: UIButton!
    
    @IBOutlet weak var upTo150Button: UIButton!
    
    @IBOutlet weak var upTo500Button: UIButton!
    
    @IBOutlet weak var filterButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTypeButtons()
        setColorButtons()
        setBrandButtons()
        setPriceButtons()

        filterButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        resetButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)

        
        filterButton.addTarget(self, action: #selector(filter), for: .touchUpInside)
        resetButton.addTarget(self, action: #selector(reset), for: .touchUpInside)

    
        
    }
    
    
    @objc func filter(_ sender: Any) {
        var brands = [Brand]()
           var colors = [Color]()
           var priceRanges = [PriceRange]()
           var types = [ShoeType]()
    
        if soccerTypeButton.isSelected {
            types.append(ShoeType.Soccer)
        }
        
        if basketballTypeButton.isSelected {
            types.append(ShoeType.Basketball)
        }
        
        if runningTypeButton.isSelected {
            types.append(ShoeType.Running)
        }
        
        if trainingTypeButton.isSelected {
            types.append(ShoeType.Training)
        }
        
        
        if blackColorButton.isSelected {
            colors.append(Color.Black)
        }
        
        if whiteColorButton.isSelected {
            colors.append(Color.White)
        }
        
        if blueColorButton.isSelected {
            colors.append(Color.Blue)
        }
        
        if yellowColorButton.isSelected {
            colors.append(Color.Yellow)
        }
        
        if greenColorButton.isSelected {
            colors.append(Color.Green)
        }
        
        
        if abibasBrandButton.isSelected {
            brands.append(Brand.Abibas)
        }
        
        if mykeyBrandButton.isSelected {
            brands.append(Brand.Mykey)
        }
        
        if bansBrandButton.isSelected {
            brands.append(Brand.Bans)
        }
        
        if overArmoudBrandButton.isSelected {
            brands.append(Brand.OverArmour)
        }
        
        if imbalanceBrandButton.isSelected {
            brands.append(Brand.ImBalance)
        }
        
        
        if upToFiftyButton.isSelected {
            priceRanges.append(PriceRange.UpTo50)
        }
        
        if upTo100Button.isSelected {
            priceRanges.append(PriceRange.UpTo100)
        }
        
        if upTo150Button.isSelected {
            priceRanges.append(PriceRange.Upto150)
        }
        if upTo500Button.isSelected {
            priceRanges.append(PriceRange.UpTo500)
        }
        
        
//        let viewController = storyboard.instantiateViewController(withIdentifier: "<YOUR ROOT CONTROLLER>")
        
        let vc = storyboard?.instantiateViewController(withIdentifier: ProductListCollectionViewController.identifier) as? ProductListCollectionViewController

        // do something vc
        vc?.brands = brands;
        vc?.colors = colors;
        vc?.priceRanges = priceRanges;
        vc?.types = types;
        self.navigationController?.setViewControllers([vc!], animated:true)

//        self.navigationController?.pushViewController(vc!, animated: true)
//        self.navigationController?.popToRootViewController(animated: true)
        
        
    }
    
    
    @objc func reset(_ sender: Any) {
        soccerTypeButton.isSelected = false
        basketballTypeButton.isSelected = false
        runningTypeButton.isSelected = false
        trainingTypeButton.isSelected = false
        blackColorButton.isSelected = false
        whiteColorButton.isSelected = false
        blueColorButton.isSelected = false
        yellowColorButton.isSelected = false
        greenColorButton.isSelected = false
        abibasBrandButton.isSelected = false
        mykeyBrandButton.isSelected = false
        bansBrandButton.isSelected = false
        overArmoudBrandButton.isSelected = false
        imbalanceBrandButton.isSelected = false
        upToFiftyButton.isSelected = false
        upTo100Button.isSelected = false
        upTo150Button.isSelected = false
        upTo500Button.isSelected = false
    }
    
    
    
    func setTypeButtons() {
        updateButton(button: soccerTypeButton)
        updateButton(button: basketballTypeButton)
        updateButton(button: runningTypeButton)
        updateButton(button: trainingTypeButton)
    }
    
    func setColorButtons() {
        updateButton(button: blackColorButton)
        updateButton(button: whiteColorButton)
        updateButton(button: blueColorButton)
        updateButton(button: yellowColorButton)
        updateButton(button: greenColorButton)
    }
    
    
    func setBrandButtons() {
        updateButton(button: abibasBrandButton)
        updateButton(button: mykeyBrandButton)
        updateButton(button: bansBrandButton)
        updateButton(button: overArmoudBrandButton)
        updateButton(button: imbalanceBrandButton)
    }
    
    func setPriceButtons() {
        updateButton(button: upToFiftyButton)
        updateButton(button: upTo100Button)
        updateButton(button: upTo150Button)
        updateButton(button: upTo500Button)
    }
    
    func updateButton(button: UIButton) {
        button.setTitle("", for: .normal)
        button.setImage(UIImage(systemName:"square"), for: .normal)
        button.setImage(UIImage(systemName:"checkmark"), for: .selected)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
     //MARK:- checkMarkTapped
    @IBAction func checkMarkTapped(_ sender: UIButton) {
        if sender == soccerTypeButton {
            print("soccerTypeButton")
        } else if sender == trainingTypeButton {
            print("trainingTypeButton")

        }
        
        UIView.animate(withDuration: 0.0, delay: 0.1, options: .curveLinear, animations: {
                    sender.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
                    
                }) { (success) in
                    UIView.animate(withDuration: 0.0, delay: 0.0, options: .curveLinear, animations: {
                        sender.isSelected = !sender.isSelected
                        sender.transform = .identity
                    
                    }, completion: nil)
        
    }
        
    }
    
    
    
//        soccerTypeButton?.setImage(UIImage(named:"square"), for: .normal)
//        soccerTypeButton?.setImage(UIImage(named:"checkmark"), for: .selected)
//
//
//          }

//          override func didReceiveMemoryWarning() {
//              super.didReceiveMemoryWarning()
//              // Dispose of any resources that can be recreated.
//          }
//          
//           //MARK:- checkMarkTapped
//          @IBAction func checkMarkTapped(_ sender: UIButton) {
//              
//          }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
