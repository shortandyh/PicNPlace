//
//  ProjectImage+CoreDataProperties.swift
//  PicNPlace
//
//  Created by stone_1 on 02/10/2018.
//  Copyright © 2018 stone1. All rights reserved.
//
//

import Foundation
import CoreData


extension ProjectImage {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ProjectImage> {
        return NSFetchRequest<ProjectImage>(entityName: "ProjectImage")
    }

    @NSManaged public var sName: String?
    @NSManaged public var sImage: NSData?
    @NSManaged public var parentProjects: Projects?

}
