//
//  ItemType+CoreDataProperties.swift
//  URLBook
//
//  Created by Ariful Tonu on 12/10/16.
//  Copyright © 2016 AndApps. All rights reserved.
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension ItemType {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ItemType> {
        return NSFetchRequest<ItemType>(entityName: "ItemType");
    }

    @NSManaged public var type: String?
    @NSManaged public var toItem: Item?

}
