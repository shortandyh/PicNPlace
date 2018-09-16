//
//  Projects+CoreDataProperties.swift
//  PicNPlace
//
//  Created by stone_1 on 05/09/2018.
//  Copyright © 2018 stone1. All rights reserved.
//
//

import Foundation
import CoreData


extension Projects {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Projects> {
        return NSFetchRequest<Projects>(entityName: "Projects")
    }

    @NSManaged public var name: String?

}
