//
//  Saving+CoreDataProperties.swift
//  
//
//  Created by Bhagya Gunawardena on 12/6/20.
//
//

import Foundation
import CoreData


extension Saving {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Saving> {
        return NSFetchRequest<Saving>(entityName: "Saving")
    }

    @NSManaged public var presentValue: String?
    @NSManaged public var futureValue: String?
    @NSManaged public var interestRate: String?
    @NSManaged public var years: String?
    @NSManaged public var monthlyContribution: String?
    @NSManaged public var compounds: String?
    @NSManaged public var time: String?

}
