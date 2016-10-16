//
//  Pin+CoreDataClass.swift
//  Virtual Tourist
//
//  Created by Lakshay Khatter on 10/16/16.
//  Copyright © 2016 Lakshay Khatter. All rights reserved.
//

import Foundation
import CoreData
import MapKit


public class Pin: NSManagedObject {
    
    convenience init(name: String, latitude:Double, longitude:Double ,context: NSManagedObjectContext){
        
        // An EntityDescription is an object that has access to all
        // the information you provided in the Entity part of the model
        // you need it to create an instance of this class.
        if let ent = NSEntityDescription.entityForName("Pin", inManagedObjectContext: context) {
            self.init(entity: ent, insertIntoManagedObjectContext: context)
            self.name = name;
            self.latitude = latitude
            self.longitude = longitude
            self.pageNumber = 0
        
        } else {
            fatalError("Unable to find Entity name!")
        }
    }

    
}
