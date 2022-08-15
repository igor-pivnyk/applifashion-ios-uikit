//
//  ShoeDetailViewController.swift
//  Applifashion
//
//  Created by Dmitry Vinnik on 8/9/22.
//

import UIKit

class ShoeDetailViewController: UIViewController {
    static let identifier = "ShoeDetailViewController"
    var shoeName = "Placeholder Name"
    var currentPriceValue: String = "$100"
    var oldPriceValue: String = Shoe.NO_OLD_PRICE
    
    let shoeSizes = ["Small (S)", "M", "L", "XL"]

    
    var shoeImage: UIImage!
    
    @IBOutlet weak var shoeLabel: UILabel!
    
    @IBOutlet weak var shoeImageView: UIImageView!
    
    @IBOutlet weak var sizePicker: UIPickerView!
    @IBOutlet weak var quantityField: UITextField!
    @IBOutlet weak var increaseQuantityButton: UIButton!
    @IBOutlet weak var decreaseQuantityButton: UIButton!
    @IBOutlet weak var size: UIPickerView!
    @IBOutlet weak var currentPrice: UILabel!
    @IBOutlet weak var oldPrice: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        sizePicker.delegate = self
        sizePicker.dataSource = self
        shoeLabel.text = shoeName
        shoeImageView.image = shoeImage
        currentPrice.text = currentPriceValue
       
        if oldPriceValue == Shoe.NO_OLD_PRICE {
            self.oldPrice.isHidden = true
        } else {
            let attributeString: NSMutableAttributedString = NSMutableAttributedString(string: oldPriceValue)
                attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSRange(location: 0, length: attributeString.length))
            self.oldPrice.attributedText = attributeString

        }
        
        handleQuantity()
    }
    
    
    func handleQuantity() {
        quantityField.isUserInteractionEnabled = true
        increaseQuantityButton.addTarget(self, action: #selector(increaseQuantity), for: .touchUpInside)

        decreaseQuantityButton.addTarget(self, action: #selector(decreaseQuantity), for: .touchUpInside)
    }
    
    @objc func decreaseQuantity() {
        quantityField.text = String(processQuantity(isIncreasingValue: false))
    }
    
    
    @objc func increaseQuantity() {
        quantityField.text = String(processQuantity(isIncreasingValue: true))
    }
    
    func processQuantity(isIncreasingValue: Bool) -> Int {
        let currentQuantityText = quantityField.text
        if Int(currentQuantityText!) == nil {
            fatalError("Only integers are allowed for the quantity field")
        }
        var currentQuantity = Int(currentQuantityText!)
        if isIncreasingValue {
            currentQuantity! += 1

        } else {
            currentQuantity! -= 1
        }
        return currentQuantity!
    }
}


extension ShoeDetailViewController: UIPickerViewDelegate, UIPickerViewDataSource {

func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
}

func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    
    return shoeSizes.count
}

func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    
    return shoeSizes[row]
}
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var label = UILabel()
        if let v = view as? UILabel { label = v }
        label.font = UIFont (name: "Helvetica Neue", size: 15)
        label.text =  shoeSizes[row]
        label.textAlignment = .center
        return label
    }
}
