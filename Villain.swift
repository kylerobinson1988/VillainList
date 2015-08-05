//
//  Villain.swift
//  CoreData1
//
//  Created by Kyle Brooks Robinson on 8/4/15.
//  Copyright (c) 2015 Kyle Brooks Robinson. All rights reserved.
//

import Foundation
import CoreData

class Villain: NSManagedObject {

    @NSManaged var name: String
    @NSManaged var age: NSNumber
    @NSManaged var likes: String
    @NSManaged var loathes: String
    @NSManaged var archrival: String
    @NSManaged var evilness: NSNumber
    @NSManaged var coolness: NSNumber

}
