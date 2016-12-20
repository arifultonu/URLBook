//
//  ItemCell.swift
//  URLBook
//
//  Created by Ariful Tonu on 12/13/16.
//  Copyright © 2016 AndApps. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {

    @IBOutlet weak var thumb: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var category: UILabel!
    @IBOutlet weak var details: UILabel!
    
    func configureCell(item: Item){
        title.text = item.title
        category.text = item.category
        details.text = item.details
        thumb.image = item.toImage?.image as? UIImage
    }
    
    
}
