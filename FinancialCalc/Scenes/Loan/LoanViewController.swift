//
//  LoanViewController.swift
//  FinancialCalc
//
//  Created by Bhagya Gunawardena on 12/6/20.
//  Copyright © 2020 iit. All rights reserved.
//

import UIKit

class LoanViewController: UIViewController {
    
    @IBOutlet weak var calculateButton: PrimaryButton!
    @IBOutlet weak var resetButton: PrimaryButton!
    @IBOutlet weak var detailsButton: PrimaryButton!
    
    @IBOutlet weak var loanAmountTextField: FinCalcTextField!
    @IBOutlet weak var interestTextField: FinCalcTextField!
    @IBOutlet weak var paymentTextField: FinCalcTextField!
    @IBOutlet weak var yearsTextField: FinCalcTextField!
    @IBOutlet weak var noOfCompoundsTextField: FinCalcTextField!
    @IBOutlet weak var answerLabel: FinCalcLabel!
    
    var loanValue : Double = 0
    var payment : Double = 0
    var years : Int = 0
    var noOfCompoundsPerYear : Int = 0
    var interestRate : Double = 0
    var resultString : String = "";
    var isError : Bool = false;

    override func viewDidLoad() {
        super.viewDidLoad()
                
        loanAmountTextField.setup(placeholder: L10n.loanValueText, delegate: self)
        paymentTextField.setup(placeholder: L10n.paymentValueText, delegate: self)
        interestTextField.setup(placeholder: L10n.interestText, delegate: self)
        yearsTextField.setup(placeholder: L10n.yearsText, delegate: self)
        noOfCompoundsTextField.setup(placeholder: L10n.compoundsText, delegate: self)

        loanAmountTextField.setKeyboard(keyboardType: .decimalPad, returnKeyType: .next)
        paymentTextField.setKeyboard(keyboardType: .decimalPad, returnKeyType: .next)
        interestTextField.setKeyboard(keyboardType: .decimalPad, returnKeyType: .next)
        yearsTextField.setKeyboard(keyboardType: .numberPad, returnKeyType: .next)
        noOfCompoundsTextField.setKeyboard(keyboardType: .numberPad, returnKeyType: .next)

        calculateButton.setTitle("CALCULATE")
        resetButton.setTitle("RESET")
    }
    
    //MARK:- Calculate on button click
    @IBAction func calculateAction(_ sender: Any) {
        //showError - show error only on button click- hide on text edit
        validateData(showError: true)
    }
    
    //MARK:- Reset on button click
    @IBAction func resetAction(_ sender: Any) {
        loanAmountTextField.text = ""
        paymentTextField.text = ""
        interestTextField.text = ""
        yearsTextField.text = ""
        noOfCompoundsTextField.text = ""
    }
    
    @IBAction func showDetailAction(_ sender: Any) {
        performSegue(withIdentifier: "seguePaymentDetail", sender: nil)
    }
    func validateData(showError : Bool) {
        isError = false
        resultString = ""

        if (loanValue > 0 && noOfCompoundsPerYear > 0 && years > 0 && interestRate > 0) {
            //can calculate monthly payment
            calculateMonthlyPayment()
        }
        
    }
    
    func calculateMonthlyPayment() {
        let n : Double = Double(noOfCompoundsPerYear);
        let t : Double = Double(years);
        let nt : Double = n * t;
        let r : Double = interestRate/100;
        let pv : Double = loanValue;
        
        let pmt = (pv * r) / (1 - (1/pow( 1 + r , nt)) )
        
        resultString = "MONTHLY PAYMENT : \(String(format:"%.2f",pmt))"
        isError = false
        setResult(showError: false)
        
    }
    
    func calculateTotalRepayment() {
        
    }
    
    func setResult(showError : Bool) {
        if (showError && isError) {
            answerLabel.set(resultString,  typographyStyle: .h4HeadingRed, alignment: .left)
        } else if (!isError) {
            answerLabel.set(resultString,  typographyStyle: .h4HeadingGreen, alignment: .left)
        } else {
            answerLabel.text = ""
        }
    }
    
}

extension LoanViewController: FinCalcTextFieldDelegate {
    func finCalcTextFieldDidTextChanged(_ finCalcTextField: FinCalcTextField, for text: String) {
        isError = false
        resultString = ""
        switch finCalcTextField {
        case loanAmountTextField:
            if let dbVal = Double(text) {
                loanValue = dbVal
            } else {
                loanValue = 0
            }
            break
        case paymentTextField:
            if let dbVal = Double(text) {
                payment = dbVal
            } else {
                payment = 0
            }
            break
        case interestTextField:
            if let dbVal = Double(text) {
                interestRate = dbVal
            } else {
                interestRate = 0
            }
            break
        case yearsTextField:
            if let intVal = Int(text) {
                years = intVal
            } else {
                years = 0
            }
            break
        case noOfCompoundsTextField:
            if let intVal = Int(text) {
                noOfCompoundsPerYear = intVal
            } else {
                noOfCompoundsPerYear = 0
            }
            break
        default:
            return
        }

        validateData(showError: false)
    }
    
    func finCalcFieldReturnTapped(_ finCalcTextField: FinCalcTextField) {
        print("return tapped")
    }

}
