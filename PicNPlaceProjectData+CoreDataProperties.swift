//
//  PicNPlaceProjectData+CoreDataProperties.swift
//  PicNPlace
//
//  Created by stone_1 on 05/09/2018.
//  Copyright © 2018 stone1. All rights reserved.
//
//

import Foundation
import CoreData


extension ProjectData  {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ProjectData> {
        return NSFetchRequest<ProjectData>(entityName: "ProjectData")
    }

    @NSManaged public var sImage: NSData?

}
