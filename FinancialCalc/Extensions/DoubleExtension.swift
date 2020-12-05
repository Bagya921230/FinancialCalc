//
//  DoubleExtension.swift
//  FinancialCalc
//
//  Created by Bhagya Gunawardena on 12/5/20.
//  Copyright © 2020 iit. All rights reserved.
//

import Foundation

extension Double {
    func round(to places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
