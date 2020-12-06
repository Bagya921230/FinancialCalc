//
//  AmortizationTableViewCell.swift
//  FinancialCalc
//
//  Created by Bhagya Gunawardena on 12/6/20.
//  Copyright © 2020 iit. All rights reserved.
//

import UIKit

class AmortizationTableViewCell: UITableViewCell {
    @IBOutlet weak var noLabel: FinCalcLabel!
    @IBOutlet weak var paymentAmountLabel: FinCalcLabel!
    @IBOutlet weak var principalAmountLabel: FinCalcLabel!
    @IBOutlet weak var interestAmountLabel: FinCalcLabel!
    @IBOutlet weak var balanceOwedLabel: FinCalcLabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setup(payAmount: String, prinAmount: String, interestAmount: String, balanceOwed: String, index: Int) {
        if (index == 0) {
            paymentAmountLabel.set(payAmount, typographyStyle: .h4HeadingGreen, alignment: .left)
            principalAmountLabel.set(prinAmount, typographyStyle: .h4HeadingGreen, alignment: .left)
            interestAmountLabel.set(interestAmount, typographyStyle: .h4HeadingGreen, alignment: .left)
            balanceOwedLabel.set(balanceOwed, typographyStyle: .h4HeadingGreen, alignment: .left)
        } else {
            paymentAmountLabel.set(payAmount, typographyStyle: .content, alignment: .left)
            principalAmountLabel.set(prinAmount, typographyStyle: .content, alignment: .left)
            interestAmountLabel.set(interestAmount, typographyStyle: .content, alignment: .left)
            balanceOwedLabel.set(balanceOwed, typographyStyle: .content, alignment: .left)
        }

    }
}
