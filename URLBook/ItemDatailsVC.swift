//
//  ItemDatailsVC.swift
//  URLBook
//
//  Created by Ariful Tonu on 12/16/16.
//  Copyright © 2016 AndApps. All rights reserved.
//

import UIKit

class ItemDatailsVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var titleField: CustomTextField!
    @IBOutlet weak var categoryField: CustomTextField!
    @IBOutlet weak var detailsField: CustomTextField!
    
    var newUrl:String = ""
    
    
    @IBOutlet weak var thumbImg: UIImageView!
    var itemToEdit: Item?
    var imagePicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       detailsField.text = newUrl
        
       // Navigation item controll.
        if let topNavigationItem = self.navigationController?.navigationBar.topItem{
            topNavigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
        }
        
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
    
        if itemToEdit != nil{
        
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

 
    @IBAction func savePressed(_ sender: UIButton) {
        var item: Item!
        
        let picture = Image(context: context)
        picture.image = thumbImg.image
        
        if itemToEdit == nil{
            item = Item(context: context)
        } else {
            item = itemToEdit
        }
        
        item.toImage = picture
        
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
    
    func loadItemData(){
        if let item = itemToEdit{
            titleField.text = item.title
            categoryField.text = item.category
            detailsField.text = item.details
            
            thumbImg.image = item.toImage?.image as? UIImage
        }
    
    }
    
    
    @IBAction func addImage(_ sender: UIButton) {
        present(imagePicker, animated: true, completion: nil)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let img = info[UIImagePickerControllerOriginalImage] as? UIImage
        {
        thumbImg.image = img
        }
        imagePicker.dismiss(animated: true, completion: nil)
    }
    

}
