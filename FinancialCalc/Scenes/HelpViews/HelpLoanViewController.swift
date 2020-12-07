//
//  HelpInvestmentViewController.swift
//  FinancialCalc
//
//  Created by Bhagya Gunawardena on 12/7/20.
//  Copyright © 2020 iit. All rights reserved.
//

import UIKit

class HelpLoanViewController: UIViewController {

    @IBOutlet weak var helpLabel: FinCalcLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let a = "⭐ Calculate Monthly Payment \n\nFill all the fields to calculate monthly payment";
        let b = "⭐ Calculate Total Payment \n\nFill all the fields to calculate total payment";
        let c = "⭐ Amortization Schedule \n\nAfter successfully getting a monthly payment value this button will be automatically enabled & you can view amortization shedule by click that button";
        let d = "⭐ History \n\nCalculation will be automatically saved to history (HOME->HISTORY";
        let e = "⭐ Reset \n\nThis button will clear input values";
        helpLabel.set("\(a)\n\n\(b)\n\n\(c)\n\n\(d)\n\n\(e)", typographyStyle: .contentWhite, alignment: .justified)
    }

    @IBAction func closeAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

}
