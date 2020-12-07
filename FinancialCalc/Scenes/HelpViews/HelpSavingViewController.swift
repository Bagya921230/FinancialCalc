//
//  HelpInvestmentViewController.swift
//  FinancialCalc
//
//  Created by Bhagya Gunawardena on 12/7/20.
//  Copyright © 2020 iit. All rights reserved.
//

import UIKit

class HelpSavingViewController: UIViewController {

    @IBOutlet weak var helpLabel: FinCalcLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let a = "⭐ Calculate monthly contribution \n\nFill other fields except monthly contribution field to calculate monthly contribution required for your present value to be grown to the given future value";
        let b = "⭐ Calculate future value \n\nFill other fields except future value field to calculate future value";
        let c = "⭐ Calculate present value \n\nFill other fields except present value field to calculate present value";
        let d = "⭐ History \n\nCalculation will be automatically saved to history (HOME->HISTORY";
        let e = "⭐ Reset \n\nThis button will clear input values";
        helpLabel.set("\(a)\n\n\(b)\n\n\(c)\n\n\(d)\n\n\(e)", typographyStyle: .contentWhite, alignment: .justified)
    }

    @IBAction func closeAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

}
