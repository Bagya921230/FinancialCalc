//
//  TabBarViewController.swift
//  FinancialCalc
//
//  Created by Bhagya Gunawardena on 12/4/20.
//  Copyright © 2020 iit. All rights reserved.
//

import UIKit
import CoreData

class TabBarViewController: UITabBarController, UITabBarControllerDelegate {
    
    var selectIndex: Int = 0
    var context: NSManagedObjectContext!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.selectedIndex = selectIndex
        self.delegate = self
    }
    
    //MARK:- helpAction
    @IBAction func helpAction(_ sender: Any) {
        switch selectedIndex {
        case 0:
            performSegue(withIdentifier: "segueInvestmentHelp", sender: nil)
        case 1:
            performSegue(withIdentifier: "segueSavingsHelp", sender: nil)
        case 2:
            performSegue(withIdentifier: "segueLoanshelp", sender: nil)
        case 3:
            performSegue(withIdentifier: "segueLoanshelp", sender: nil)
        default:
            return
        }
    }
    
    //MARK:- UITabBarDelegate
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        print("Selected item",item)
    }
    
    //MARK:- UITabBarControllerDelegate
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {

    }

}
