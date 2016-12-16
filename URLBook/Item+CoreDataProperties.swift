//
//  Item+CoreDataProperties.swift
//  URLBook
//
//  Created by Ariful Tonu on 12/10/16.
//  Copyright © 2016 AndApps. All rights reserved.
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension Item {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Item> {
        return NSFetchRequest<Item>(entityName: "Item");
    }

    @NSManaged public var details: String?
    @NSManaged public var title: String?
    @NSManaged public var created: NSDate?
    @NSManaged public var category: String?
    @NSManaged public var toImage: Image?
    @NSManaged public var toItemType: ItemType?
    @NSManaged public var toStore: Store?

}
