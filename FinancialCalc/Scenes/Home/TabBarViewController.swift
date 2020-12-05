//
//  TabBarViewController.swift
//  FinancialCalc
//
//  Created by Bhagya Gunawardena on 12/4/20.
//  Copyright © 2020 iit. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController, UITabBarControllerDelegate {
    
    var selectIndex: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        self.selectedIndex = selectIndex
        self.delegate = self
    }
    
    //MARK:- UITabBarDelegate
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        print("Selected item",item)
    }
    
    //MARK:- UITabBarControllerDelegate
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        let selectedIndex = tabBarController.viewControllers?.firstIndex(of: viewController)!
        switch selectedIndex {
        case 0:
            self.title = "SAVINGS"
        case 1:
            self.title = "COMPOUND INTEREST SAVINGS"
        case 2:
            self.title = "LOANS"
        case 3:
            self.title = "MORTGAGE"
        default:
            return
        }
    }

}
