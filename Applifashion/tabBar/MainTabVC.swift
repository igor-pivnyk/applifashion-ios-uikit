//
//  MainTabVC.swift
//  Applifashion
//
//  Created by Dmitry Vinnik on 8/1/22.
//

import UIKit

class MainTabVC: UITabBarController, UITabBarControllerDelegate {
   
    
//    func tabBarController(_ tabBarController: UITabBarController, didEndCustomizing viewControllers: [UIViewController], changed: Bool) {
//        for vc in viewControllers {
//            //Tell iOS that `isEnabled` property has changed.
//            vc.tabBarItem.isEnabled = !vc.tabBarItem.isEnabled
//            vc.tabBarItem.isEnabled = !vc.tabBarItem.isEnabled  //This duplicate is not a mistake!
//        }
//    }
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
            let selectedIndex = tabBarController.viewControllers?.firstIndex(of: viewController)!
            if  selectedIndex == 2 || selectedIndex == 3 {
                //Do anything.
                return false
            }
            return true
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self // Delegate self to handle delegate methods.

//        UITabBar.appearance().barTintColor = UIColor.black // your color

//        self.tabBarController?.tabBar.items?[0].isEnabled=false

//        let tabBarControllerItems = self.tabBarController?.tabBar.items
        
//        tabBarControllerItems?[1].isEnabled = false
//        if let tabArray = tabBarControllerItems {
//                let tabBarItem1 = tabArray[1]
//                let tabBarItem2 = tabArray[2]
//
//                tabBarItem1.isEnabled = false
//                tabBarItem2.isEnabled = false
//            }
        
//        self.tabBarController.tabBar.items![1].isEnabled = false
//        self.tabBarController!.tabBar.items![2].isEnabled = false
//        self.tabBarController!.tabBar.items![3].isEnabled = false

        
//
        view.backgroundColor = .systemYellow
//
//        let applifashionLogo = UINavigationController(rootViewController: ProductListCollectionViewController())
//        let search = UINavigationController(rootViewController: SearchVC())
//        let profile = UINavigationController(rootViewController: ProfileVC())
//        let cart = UINavigationController(rootViewController: CartVC())
//
//        search.tabBarItem.image = UIImage(systemName: "play.circle")
//        profile.tabBarItem.image = UIImage(systemName: "magnifyingglass")
//        cart.tabBarItem.image = UIImage(systemName: "arrow.down.to.line")
////
////        vc1.title = "Home"
////        vc2.title = "Coming Soon"
////        vc3.title = "Top Search"
////        vc4.title = "Downloads"
//
//        tabBar.tintColor = .label
//
//        setViewControllers([applifashionLogo, search, profile, cart ], animated: true)
    }


}
