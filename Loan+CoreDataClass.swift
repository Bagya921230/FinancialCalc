//
//  Loan+CoreDataClass.swift
//  
//
//  Created by Bhagya Gunawardena on 12/7/20.
//
//

import Foundation
import CoreData

@objc(Loan)
public class Loan: NSManagedObject {
    convenience init(type: String, payment: String, total: String, loan: String,rate: String, compounds: String,time: String ,year: String , inserIntoManagedObjectContext context: NSManagedObjectContext!) {
        self.init(context: context)
        self.type = type
        self.payment = payment
        self.total = total
        self.loan = loan
        self.rate = rate
        self.compounds = compounds
        self.time = time
        self.year = year
    }
}
