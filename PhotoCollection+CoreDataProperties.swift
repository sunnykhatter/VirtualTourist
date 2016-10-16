//
//  PhotoCollection+CoreDataProperties.swift
//  Virtual Tourist
//
//  Created by Lakshay Khatter on 10/16/16.
//  Copyright © 2016 Lakshay Khatter. All rights reserved.
//

import Foundation
import CoreData


extension PhotoCollection {

    @nonobjc public override class func fetchRequest() -> NSFetchRequest {
        return NSFetchRequest(entityName: "PhotoCollection");
    }

    @NSManaged public var filePath: String?
    @NSManaged public var id: String?
    @NSManaged public var title: String?
    @NSManaged public var url: String?
    @NSManaged public var pin: Pin?

}
