//
//  CompoundSavingsViewController.swift
//  FinancialCalc
//
//  Created by Bhagya Gunawardena on 12/6/20.
//  Copyright © 2020 iit. All rights reserved.
//

import UIKit
import CoreData

class CompoundSavingsViewController: CustomViewController {

    @IBOutlet weak var calculateButton: PrimaryButton!
    @IBOutlet weak var resetButton: UIButton!
    
    @IBOutlet weak var presentValueTextField: FinCalcTextField!
    @IBOutlet weak var futureValueTextField: FinCalcTextField!
    @IBOutlet weak var interestTextField: FinCalcTextField!
    @IBOutlet weak var contributionPaymentTextField: FinCalcTextField!
    @IBOutlet weak var yearsTextField: FinCalcTextField!
    @IBOutlet weak var noOfCompoundsTextField: FinCalcTextField!
    @IBOutlet weak var answerLabel: FinCalcLabel!
    
    var presentValue : Double = 0
    var futureValue : Double = 0
    var contribution : Double = 0
    var years : Int = 0
    var noOfCompoundsPerYear : Int = 0
    var interestRate : Double = 0
    var resultString : String = "";
    var isError : Bool = false;
    var saving: Saving?
    
    var context:NSManagedObjectContext? {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return nil
        }
        return appDelegate.persistentContainer.viewContext
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presentValueTextField.setup(placeholder: L10n.presentValueText, delegate: self)
        futureValueTextField.setup(placeholder: L10n.futureValueText, delegate: self)
        interestTextField.setup(placeholder: L10n.interestText, delegate: self)
        yearsTextField.setup(placeholder: L10n.yearsText, delegate: self)
        contributionPaymentTextField.setup(placeholder: L10n.contributionValueText, delegate: self)
        noOfCompoundsTextField.setup(placeholder: L10n.compoundsText, delegate: self)

        presentValueTextField.setKeyboard(keyboardType: .decimalPad, returnKeyType: .next)
        futureValueTextField.setKeyboard(keyboardType: .decimalPad, returnKeyType: .next)
        interestTextField.setKeyboard(keyboardType: .decimalPad, returnKeyType: .next)
        contributionPaymentTextField.setKeyboard(keyboardType: .decimalPad, returnKeyType: .next)
        yearsTextField.setKeyboard(keyboardType: .numberPad, returnKeyType: .next)
        noOfCompoundsTextField.setKeyboard(keyboardType: .numberPad, returnKeyType: .next)

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
        presentValueTextField.text = ""
        futureValueTextField.text = ""
        interestTextField.text = ""
        yearsTextField.text = ""
        noOfCompoundsTextField.text = ""
    }
    
    func validateData(showError : Bool) {
        isError = false
        resultString = ""

        if (presentValue > 0 && futureValue > 0 && years > 0 && noOfCompoundsPerYear > 0 && interestRate > 0 && contribution > 0 ) {
            //if all are available nothing to show
            resultString = ""
            isError = false
            setResult(showError: showError)
            return
        }else if (interestRate > 0 && futureValue > 0 && years > 0 && noOfCompoundsPerYear > 0 && contribution > 0) {
            //can calculate present value
            calculatePresentValue()
            return
        } else if (interestRate > 0 && presentValue > 0 && years > 0 && noOfCompoundsPerYear > 0 && contribution > 0 ) {
            //can calculate future value
            calculateFutureValue()
            return
        } else if (interestRate > 0 && presentValue > 0 && years > 0 && noOfCompoundsPerYear > 0 && futureValue > 0){
            //can calculate monthly contribution needed
            calculateMonthlyContribution()
        } else {
            resultString = "Insufficient inputs"
            isError = true
            setResult(showError: showError)
            return
        }
    }
    
    func calculatePresentValue() {
        let n : Double = Double(noOfCompoundsPerYear);
        let t : Double = Double(years);
        let nt : Double = n * t;
        let r : Double = interestRate/100;
        let fv : Double = futureValue;
        
        let sv : Double = calculateSeriesValue()
        let pv = (fv - sv)/pow( 1 + (r/n),nt)
        resultString = "INITIAL INVESTMENT VALUE : \(String(format:"%.2f",pv))"
        
        //SAVE TO COREDATA
        
        saving = Saving(presentValue: String(format:"%.2f",pv), futureValue: String(format:"%.2f",fv), interestRate: String(format:"%.2f",interestRate), years: String(years), monthlyContribution: String(format:"%.2f",contribution), compounds: String(noOfCompoundsPerYear), time: getTodayString(), inserIntoManagedObjectContext: self.context)
        isError = false
        setResult(showError: false)
    }
    
    func calculateInterestForPrincipal() -> Double{
        let n : Double = Double(noOfCompoundsPerYear)
        let t : Double = Double(years)
        let nt : Double = n * t
        let r : Double = interestRate/100
        let pv : Double = presentValue;
        
        let fv = pv * pow( 1 + (r/n),nt)
        return fv
    }
    
    func calculateSeriesValue() -> Double {
        let n : Double = Double(noOfCompoundsPerYear)
        let t : Double = Double(years)
        let nt : Double = n * t
        let r : Double = interestRate/100
        let pmt : Double = contribution
        
        let sv = pmt * (((pow(1 + (r/n),nt)) - 1 )/(r/n))
        return sv
    }
    
    func calculateMonthlyContribution() {
        let n : Double = Double(noOfCompoundsPerYear)
        let t : Double = Double(years);
        let nt : Double = n * t
        let r : Double = interestRate/100
        let fv : Double = futureValue
        let ip : Double = calculateInterestForPrincipal()
        
        let mc = (fv - ip) / (((pow(1 + (r/n),nt)) - 1 )/(r/n))
        resultString = "MONTHLY CONTRIBUTION NEEDED : \(String(format:"%.2f",mc))"
        
        //SAVE TO COREDATA
        saving = Saving(presentValue: String(format:"%.2f",presentValue), futureValue: String(format:"%.2f",fv), interestRate: String(format:"%.2f",interestRate), years: String(years), monthlyContribution: String(format:"%.2f",contribution), compounds: String(noOfCompoundsPerYear), time: getTodayString(), inserIntoManagedObjectContext: self.context)
        
        isError = false
        setResult(showError: false)    }

    
    func calculateFutureValue() {
        let fv = calculateInterestForPrincipal() + calculateSeriesValue()
        resultString = "FUTURE VALUE : \(String(format:"%.2f",fv))"
        
        //SAVE TO COREDATA
        saving = Saving(presentValue: String(format:"%.2f",presentValue), futureValue: String(format:"%.2f",fv), interestRate: String(format:"%.2f",interestRate), years: String(years), monthlyContribution: String(format:"%.2f",contribution), compounds: String(noOfCompoundsPerYear), time: getTodayString(), inserIntoManagedObjectContext: self.context)
        
        isError = false
        setResult(showError: false)
    }
    
    
    func calculateYears() {
        let n : Double = Double(noOfCompoundsPerYear);
        let r : Double = interestRate/100;
        let fv : Double = futureValue;
        let pv : Double = presentValue;

        let t = log(fv/pv) / (n * log( 1 + (r/n)))
        let totalNumPayment = t * n
        resultString = "YEARS : \(String(format:"%.0f",t)) \n TOTAL NUMBER OF PAYMENTS :\(String(format:"%.0f",totalNumPayment))"
        
        //SAVE TO COREDATA
        saving = Saving(presentValue: String(format:"%.2f",presentValue), futureValue: String(format:"%.2f",futureValue), interestRate: String(format:"%.2f",interestRate), years: String(t), monthlyContribution: String(format:"%.2f",contribution), compounds: String(noOfCompoundsPerYear), time: getTodayString(), inserIntoManagedObjectContext: self.context)
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

extension CompoundSavingsViewController: FinCalcTextFieldDelegate {
    func finCalcTextFieldDidTextChanged(_ finCalcTextField: FinCalcTextField, for text: String) {
        isError = false
        resultString = ""
        switch finCalcTextField {
        case presentValueTextField:
            if let dbVal = Double(text) {
                presentValue = dbVal
            } else {
                presentValue = 0
            }
            break
        case contributionPaymentTextField:
            if let dbVal = Double(text) {
                contribution = dbVal
            } else {
                contribution = 0
            }
            break
        case futureValueTextField:
            if let dbVal = Double(text) {
                futureValue = dbVal
            } else {
                futureValue = 0
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
