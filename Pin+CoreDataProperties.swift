//
//  Pin+CoreDataProperties.swift
//  Virtual Tourist
//
//  Created by Lakshay Khatter on 10/16/16.
//  Copyright © 2016 Lakshay Khatter. All rights reserved.
//

import Foundation
import CoreData

extension Pin {

    @nonobjc public override class func fetchRequest() -> NSFetchRequest {
        return NSFetchRequest(entityName: "Pin");
    }

    @NSManaged public var name: String?
    @NSManaged public var longitude: Double
    @NSManaged public var latitude: Double
    @NSManaged public var pageNumber: Int32
    @NSManaged public var photoCollection: PhotoCollection?

}
