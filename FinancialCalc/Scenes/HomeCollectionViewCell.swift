//
//  HomeCollectionViewCell.swift
//  FinancialCalc
//
//  Created by Bhagya Gunawardena on 12/3/20.
//  Copyright © 2020 iit. All rights reserved.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView : UIImageView!
    @IBOutlet weak var titleLabel : FinCalcLabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setup(image: UIImage, title: String) {
        imageView.image = image
        imageView.tintColor = ColorName.primary.color
        imageView.contentMode = .scaleAspectFit
        titleLabel.set(title, typographyStyle: .componentTextFieldSmall, alignment: .center)
    }
}
