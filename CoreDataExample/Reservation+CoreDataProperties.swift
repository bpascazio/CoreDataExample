//
//  Reservation+CoreDataProperties.swift
//  CoreDataExample
//
//  Created by Bob Pascazio on 11/23/15.
//  Copyright © 2015 NYCDA. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Reservation {

    @NSManaged var pickedup: NSNumber?
    @NSManaged var car: Car?
    @NSManaged var customer: Customer?

}
