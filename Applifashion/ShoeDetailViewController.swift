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
    var shoeImage: UIImage!
    
    @IBOutlet weak var shoeLabel: UILabel!
    
    @IBOutlet weak var shoeImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        shoeLabel.text = shoeName
        shoeImageView.image = shoeImage
            }
    
    
    


}
