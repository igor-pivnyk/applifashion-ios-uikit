//
//  MainTabVC.swift
//  Applifashion
//
//  Created by Dmitry Vinnik on 8/1/22.
//

import UIKit

class MainTabVC: UITabBarController, UITabBarControllerDelegate {
   
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
            let selectedIndex = tabBarController.viewControllers?.firstIndex(of: viewController)!
            if  selectedIndex == 1 || selectedIndex == 2 || selectedIndex == 3 {
                //Do anything.
                return false
            }
            return true
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
    }


}
