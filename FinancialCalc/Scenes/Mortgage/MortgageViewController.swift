//
//  MortgageViewController.swift
//  FinancialCalc
//
//  Created by Bhagya Gunawardena on 12/5/20.
//  Copyright © 2020 iit. All rights reserved.
//

import UIKit

class MortgageViewController: CustomViewController {
    
    @IBOutlet weak var calculateButton: PrimaryButton!
    @IBOutlet weak var resetButton: UIButton!
    
    @IBOutlet weak var loanAmountTextField: FinCalcTextField!
    @IBOutlet weak var interestTextField: FinCalcTextField!
    @IBOutlet weak var yearsTextField: FinCalcTextField!
    @IBOutlet weak var answerLabel: FinCalcLabel!
    
    var loanValue : Double = 0
    var years : Int = 0
    var noOfCompoundsPerYear : Int = 12
    var interestRate : Double = 0
    var resultString : String = "";
    var isError : Bool = false;

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loanAmountTextField.setup(placeholder: L10n.loanValueText, delegate: self)
        interestTextField.setup(placeholder: L10n.interestText, delegate: self)
        yearsTextField.setup(placeholder: L10n.yearsText, delegate: self)

        loanAmountTextField.setKeyboard(keyboardType: .decimalPad, returnKeyType: .next)
        interestTextField.setKeyboard(keyboardType: .decimalPad, returnKeyType: .next)
        yearsTextField.setKeyboard(keyboardType: .numberPad, returnKeyType: .next)

        calculateButton.setTitle("CALCULATE")
        resetButton.titleLabel?.text = "RESET"
    }
    
    //MARK:- Calculate on button click
    @IBAction func calculateAction(_ sender: Any) {
        //showError - show error only on button click- hide on text edit
        validateData(showError: true)
    }
    
    //MARK:- Reset on button click
    @IBAction func resetAction(_ sender: Any) {
        loanAmountTextField.text = ""
        interestTextField.text = ""
        yearsTextField.text = ""
    }
    
    func validateData(showError : Bool) {
        isError = false
        resultString = ""

        if (loanValue > 0 && years > 0 && interestRate > 0) {
            calculateBothPayments()
        } else {
            resultString = "Insufficient inputs"
            isError = true
            setResult(showError: showError)
            return
        }
        
    }
    
    func calculateBothPayments(){
        let n : Double = Double(noOfCompoundsPerYear)
        let t : Double = Double(years)
        let nt : Double = n * t
        let r : Double = interestRate/100
        //monthly interest rate
        let mr : Double = r/12
        let pv : Double = loanValue
        
        let pmt = ((pv * mr)*pow((1 + mr),nt)) / (pow((1 + mr),nt)-1)
        
        let fv = ((mr * pv ) / (1 - ((pow(1 + mr,((-1)*nt))))) ) * nt
        
        resultString = "MONTHLY PAYMENT : \(String(format:"%.2f",pmt)) \nTOTAL PAYMENT : \(String(format:"%.2f",fv))"
        isError = false
        setResult(showError: false)
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

extension MortgageViewController: FinCalcTextFieldDelegate {
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
        default:
            return
        }

        validateData(showError: false)
    }
    
    func finCalcFieldReturnTapped(_ finCalcTextField: FinCalcTextField) {
        print("return tapped")
    }

}
