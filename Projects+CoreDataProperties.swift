//
//  Projects+CoreDataProperties.swift
//  PicNPlace
//
//  Created by stone_1 on 02/10/2018.
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
    @NSManaged public var projectImages: NSSet?

}

// MARK: Generated accessors for projectImages
extension Projects {

    @objc(addProjectImagesObject:)
    @NSManaged public func addToProjectImages(_ value: ProjectImage)

    @objc(removeProjectImagesObject:)
    @NSManaged public func removeFromProjectImages(_ value: ProjectImage)

    @objc(addProjectImages:)
    @NSManaged public func addToProjectImages(_ values: NSSet)

    @objc(removeProjectImages:)
    @NSManaged public func removeFromProjectImages(_ values: NSSet)

}
