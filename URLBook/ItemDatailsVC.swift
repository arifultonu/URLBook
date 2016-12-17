//
//  ItemDatailsVC.swift
//  URLBook
//
//  Created by Ariful Tonu on 12/16/16.
//  Copyright © 2016 AndApps. All rights reserved.
//

import UIKit

class ItemDatailsVC: UIViewController {

    @IBOutlet weak var titleField: CustomTextField!
    @IBOutlet weak var categoryField: CustomTextField!
    @IBOutlet weak var detailsField: CustomTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
       // Navigation item controll.
        if let topNavigationItem = self.navigationController?.navigationBar.topItem{
            topNavigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

 
    @IBAction func savePressed(_ sender: UIButton) {
        let item = Item(context: context)
        
        if let title = titleField.text{
        item.title = title
        }
        
        if let category = categoryField.text{
            item.category = category
        }
        
        if let details = detailsField.text{
            item.details = details
        }
        
       ad.saveContext()
        
       _ = navigationController?.popViewController(animated: true)
        
        
    }
    
    
    
    
    
    
    
    

}
