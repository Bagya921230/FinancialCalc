//
//  PaymentDetailsViewController.swift
//  FinancialCalc
//
//  Created by Bhagya Gunawardena on 12/6/20.
//  Copyright © 2020 iit. All rights reserved.
//

import UIKit

class PaymentDetailsViewController: CustomViewController {

    @IBOutlet weak var tableView: UITableView!
    var amortizations = [Amortization]()
    var monthlyPayment : Double?
    var loanAmount :Double?
    var rate : Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        setData()
    }
    
    func setData() {
        guard let pmt = monthlyPayment, let r = rate, let loanAmount = loanAmount else {
            return
        }
        var pb = loanAmount
        for _ in 1...12 {
            print("PMT------------------------------", pmt)
            let ia = pb * r/12
            print("INTESREST AMOUNT-----------------", ia)
            let dp = pmt - ia
            print("PRINCIPAL AMOUNT-----------------",dp)
            pb = pb - dp
            print("BALANCE OWED-------------------------------||||||||||||||||",pb)
            guard let amort = Amortization(payAmount: String(format:"%.2f",pmt), prinAmount: String(format:"%.2f",dp), interestAmount: String(format:"%.2f",ia), balanceOwed: String(format:"%.2f",pb)) else {
                fatalError("Unable to instantiate meal1")
            }
            amortizations += [amort]
        }
    }

}

extension PaymentDetailsViewController : UITableViewDataSource , UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return amortizations.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "amortCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? AmortizationTableViewCell else {
            fatalError("The dequed cell is not an instance of AmortizationTableViewCell")
        }
        if (indexPath.row == 0) {
            cell.setup(payAmount: "Payment\nAmount", prinAmount: "Principal\nAmount", interestAmount: "Interest\nAmount", balanceOwed: "Balanced\nOwed", index: 0)
        } else {
            let amort = amortizations[indexPath.row - 1]
            cell.setup(payAmount: amort.paymentAmount, prinAmount: amort.principalAmount, interestAmount: amort.interestAmount, balanceOwed: amort.balanceOwed, index: indexPath.row)
        }
        return cell
    }
}

