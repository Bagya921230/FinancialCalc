//
//  HomeViewController.swift
//  FinancialCalc
//
//  Created by Bhagya Gunawardena on 12/3/20.
//  Copyright © 2020 iit. All rights reserved.
//

import UIKit
import CoreData

class HomeViewController: CustomViewController {
    
    //MARK: Outlets
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var descriptionLabel: FinCalcLabel!
    
    var selectedIndex: Int = 0
    var selectedType: String = ""
    
    var context:NSManagedObjectContext? {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return nil
        }
        return appDelegate.persistentContainer.viewContext
    }
    
    var titleList: [String] = ["INVESTMENT","SAVING", "LOANS", "MORTGAGE"]
    var imageList: [UIImage] = [ Asset.saving.image,Asset.compoundIntesrest.image, Asset.loan.image, Asset.mortgage1.image]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        descriptionLabel.set("Find past calculation results using below history facility", typographyStyle: .contentWhite, alignment: .center)
    }
    
     //MARK: History Button Actions
    @IBAction func showLoanHistoryAction(_ sender: Any) {
        selectedType = "LOAN"
        performSegue(withIdentifier: "segueHistory", sender: nil)
    }
    
    @IBAction func showMortHistoryAction(_ sender: Any) {
        selectedType = "MORT"
        performSegue(withIdentifier: "segueHistory", sender: nil)
    }
    
    @IBAction func showSavingHistoryAction(_ sender: Any) {
        selectedType = "SAVING"
        performSegue(withIdentifier: "segueHistory", sender: nil)
    }
    
    @IBAction func showInvestmentHistoryAction(_ sender: Any) {
        selectedType = "INVESTMENT"
        performSegue(withIdentifier: "segueHistory", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "segueTabbar":
            let vc = segue.destination as! TabBarViewController
            vc.selectIndex = selectedIndex
            vc.title = titleList[selectedIndex]
            break
        case "segueHistory":
            let vc = segue.destination as! HistoryViewController
            vc.selectedType = selectedType
            break
        default:
            return
        }
    }
}

extension HomeViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
        performSegue(withIdentifier: "segueTabbar", sender: nil)
    }
    
}

extension HomeViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellIdentifier = "HomeCell"
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as? HomeCollectionViewCell else {
            fatalError("The dequed cell is not an instance of HomeCollectionViewCell")
        }
        cell.roundCorners(corners: .allCorners, radius: 5)
        cell.setup(image: imageList[indexPath.row], title: titleList[indexPath.row])
        return cell
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: (screenWidth/2)-20, height: (screenWidth/2))
    }
}
