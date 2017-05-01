//
//  Item+CoreDataClass.swift
//  URLBook
//
//  Created by Ariful Tonu on 12/10/16.
//  Copyright © 2016 AndApps. All rights reserved.
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData

@objc(Item)
public class Item: NSManagedObject {
    
    public override func awakeFromInsert() {
        super.awakeFromInsert()
        self.created = NSDate()
    }

}
