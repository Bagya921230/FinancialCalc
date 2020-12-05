//
//  MortgageViewController.swift
//  FinancialCalc
//
//  Created by Bhagya Gunawardena on 12/5/20.
//  Copyright © 2020 iit. All rights reserved.
//

import UIKit

class MortgageViewController: CustomViewController {
    
    @IBOutlet weak var loanAmountTextField: FinCalcTextField!
    @IBOutlet weak var interestRateTextField: FinCalcTextField!
    @IBOutlet weak var paymentTextField: FinCalcTextField!
    @IBOutlet weak var yearsTextField: FinCalcTextField!
    @IBOutlet weak var compounsPerYearTextField: FinCalcTextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
