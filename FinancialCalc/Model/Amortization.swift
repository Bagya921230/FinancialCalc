//
//  Amortization.swift
//  FinancialCalc
//
//  Created by Bhagya Gunawardena on 12/6/20.
//  Copyright © 2020 iit. All rights reserved.
//

import Foundation

import UIKit

class Amortization {
    
    //MARK:- Properties
    var paymentAmount: String
    var principalAmount: String
    var interestAmount: String
    var balanceOwed: String
    
    //MARK:- Initialization
    init?(payAmount: String, prinAmount: String, interestAmount: String, balanceOwed: String) {
        
        self.paymentAmount = payAmount
        self.principalAmount = prinAmount
        self.interestAmount = interestAmount
        self.balanceOwed = balanceOwed
        
    }
}
