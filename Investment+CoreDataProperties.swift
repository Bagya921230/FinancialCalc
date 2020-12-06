//
//  Investment+CoreDataProperties.swift
//  
//
//  Created by Bhagya Gunawardena on 12/6/20.
//
//

import Foundation
import CoreData


extension Investment {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Investment> {
        return NSFetchRequest<Investment>(entityName: "Investment")
    }

    @NSManaged public var presentValue: String?
    @NSManaged public var futureValue: String?
    @NSManaged public var interestRate: String?
    @NSManaged public var years: String?
    @NSManaged public var compounds: String?
    @NSManaged public var time: String?

}
