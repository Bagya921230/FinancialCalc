//
//  HomeViewController.swift
//  FinancialCalc
//
//  Created by Bhagya Gunawardena on 12/3/20.
//  Copyright © 2020 iit. All rights reserved.
//

import UIKit

class HomeViewController: CustomViewController {
    
    //MARK: Outlets
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var gbpLabel: FinCalcLabel!
    @IBOutlet weak var usdLabel: FinCalcLabel!
    @IBOutlet weak var audLabel: FinCalcLabel!
    
    var selectedIndex: Int = 0
    
    var titleList: [String] = ["SAVINGS","COMPOUND INT.\nSAVINGS", "LOANS", "MORTGAGE"]
    var imageList: [UIImage] = [ Asset.saving.image,Asset.compoundIntesrest.image, Asset.loan.image, Asset.mortgage1.image]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        usdLabel.set( "\u{1F1FA}\u{1F1F8} USD 1.2436", typographyStyle: .content, alignment: .left)
        gbpLabel.set("\u{1F1EC}\u{1F1E7} GBP 1.3434", typographyStyle: .content, alignment: .left)
        audLabel.set("\u{1F1E6}\u{1F1FA} AUD 1.3434", typographyStyle: .content, alignment: .left)
        //collectionView.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: "HomeCell")
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "segueTabbar":
            let vc = segue.destination as! TabBarViewController
            vc.selectIndex = selectedIndex
            if (selectedIndex == 1) {
                vc.title = "COMPOUND INTEREST SAVINGS"
            } else {
                vc.title = titleList[selectedIndex]
            }
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
