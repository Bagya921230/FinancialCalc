//
//  HistoryTableViewCell.swift
//  FinancialCalc
//
//  Created by Bhagya Gunawardena on 12/6/20.
//  Copyright © 2020 iit. All rights reserved.
//

import UIKit

class HistoryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var presentLabel: FinCalcLabel!
    @IBOutlet weak var futureLabel: FinCalcLabel!
    @IBOutlet weak var rateLabel: FinCalcLabel!
    @IBOutlet weak var yearLabel: FinCalcLabel!
    @IBOutlet weak var compoundLabel: FinCalcLabel!
    @IBOutlet weak var contributionPayLabel: FinCalcLabel!
    @IBOutlet weak var presentValLabel: FinCalcLabel!
    @IBOutlet weak var futureValLabel: FinCalcLabel!
    @IBOutlet weak var rateValLabel: FinCalcLabel!
    @IBOutlet weak var yearValLabel: FinCalcLabel!
    @IBOutlet weak var compoundValLabel: FinCalcLabel!
    @IBOutlet weak var contributionPayValLabel: FinCalcLabel!
    @IBOutlet weak var timeLabel: FinCalcLabel!


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func holderSetup(selectedType: String) {
        rateLabel.set("Interest Rate", typographyStyle: .contentLight)
        yearLabel.set("Years", typographyStyle: .contentLight)
        compoundLabel.set("Compounds/Year", typographyStyle: .contentLight)

        if (selectedType == "LOAN") {
            presentLabel.set("Loan Amount", typographyStyle: .contentLight)
            futureLabel.set("Total payment", typographyStyle: .contentLight)
            contributionPayLabel.set("Monthly Payment", typographyStyle: .contentLight)

        } else if (selectedType == "MORT") {
            presentLabel.set("Loan Amount", typographyStyle: .contentLight)
            futureLabel.set("Total payment", typographyStyle: .contentLight)
            contributionPayLabel.set("Monthly Payment", typographyStyle: .contentLight)

        } else if (selectedType == "SAVING") {
            presentLabel.set("Present Value", typographyStyle: .contentLight)
            futureLabel.set("Future Value", typographyStyle: .contentLight)
            contributionPayLabel.isHidden = true
            contributionPayValLabel.isHidden = true
            
        } else if (selectedType == "INVESTMENT"){
            presentLabel.set("Present Value", typographyStyle: .contentLight)
            futureLabel.set("Future Value", typographyStyle: .contentLight)
            contributionPayLabel.set("Monthly Contribution", typographyStyle: .contentLight)
        }
    }
    
    func setUp(valPresent : String, valFuture : String,valRate : String, valYear : String,valCompound : String, valContribution : String,time : String) {
        presentValLabel.set(valPresent,typographyStyle: .componentTextFieldSmall)
        futureValLabel.set(valFuture,typographyStyle: .componentTextFieldSmall)
        rateValLabel.set(valRate,typographyStyle: .componentTextFieldSmall)
        yearValLabel.set(valYear,typographyStyle: .componentTextFieldSmall)
        compoundValLabel.set(valCompound,typographyStyle: .componentTextFieldSmall)
        contributionPayValLabel.set(valContribution,typographyStyle: .componentTextFieldSmall)
        timeLabel.set(time, typographyStyle: .h4HeadingGreen)
    }

}
