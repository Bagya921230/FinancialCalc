//
//  Loan+CoreDataProperties.swift
//  
//
//  Created by Bhagya Gunawardena on 12/7/20.
//
//

import Foundation
import CoreData


extension Loan {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Loan> {
        return NSFetchRequest<Loan>(entityName: "Loan")
    }

    @NSManaged public var compounds: String?
    @NSManaged public var loan: String?
    @NSManaged public var payment: String?
    @NSManaged public var rate: String?
    @NSManaged public var time: String?
    @NSManaged public var total: String?
    @NSManaged public var type: String?
    @NSManaged public var year: String?

}
