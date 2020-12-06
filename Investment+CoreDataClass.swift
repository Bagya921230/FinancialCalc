//
//  Investment+CoreDataClass.swift
//  
//
//  Created by Bhagya Gunawardena on 12/6/20.
//
//

import Foundation
import CoreData

@objc(Investment)
public class Investment: NSManagedObject {

    convenience init(presentValue: String, futureValue: String, interestRate: String, years: String,compounds: String,time: String , inserIntoManagedObjectContext context: NSManagedObjectContext!) {
        self.init(context: context)
        self.presentValue = presentValue
        self.futureValue = futureValue
        self.interestRate = interestRate
        self.years = years
        self.compounds = compounds
        self.time = time
    }

}
