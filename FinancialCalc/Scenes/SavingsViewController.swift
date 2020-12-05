//
//  SavingsViewController.swift
//  FinancialCalc
//
//  Created by Bhagya Gunawardena on 12/4/20.
//  Copyright © 2020 iit. All rights reserved.
//

import UIKit

class SavingsViewController: CustomViewController {

    @IBOutlet weak var resetButton: SecondaryButton!
    @IBOutlet weak var calculateButton: PrimaryButton!
    @IBOutlet weak var presentValueTextField: FinCalcTextField!
    @IBOutlet weak var futureValueTextField: FinCalcTextField!
    @IBOutlet weak var interestTextField: FinCalcTextField!
    @IBOutlet weak var paymentTextField: FinCalcTextField!
    @IBOutlet weak var noOfPaymentsTextField: FinCalcTextField!
    @IBOutlet weak var noOfCompoundsTextField: FinCalcTextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        presentValueTextField.delegate = self
        futureValueTextField.delegate = self
        interestTextField.delegate = self
        paymentTextField.delegate = self
        noOfPaymentsTextField.delegate = self
        noOfCompoundsTextField.delegate = self
        calculateButton.setTitle("CALCULATE")
        resetButton.setTitle("RESET")
    }
    
    
}
