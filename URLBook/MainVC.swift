//
//  MainVC.swift
//  URLBook
//
//  Created by Ariful Tonu on 11/11/16.
//  Copyright © 2016 AndApps. All rights reserved.
//

import UIKit
import GoogleMobileAds
import CoreData

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource, GADBannerViewDelegate, NSFetchedResultsControllerDelegate{

    @IBOutlet weak var adBanner: GADBannerView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var segment: UISegmentedControl!
    
    var controller: NSFetchedResultsController<Item>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Table View Start
        tableView.delegate = self
        tableView.dataSource = self
        

        
        // Google AdMod Start
        adBanner.isHidden = true
        adBanner.delegate = self
        
        adBanner.adUnitID = "ca-app-pub-2520008502309661/1381129637"
        adBanner.rootViewController = self
        //adBanner.load(<#T##request: GADRequest?##GADRequest?#>)
        let request = GADRequest()
        adBanner.load(request)
        // Google AdMod End
        
        //generateTestData()
        attemptFetch()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
   // Google AdMod Start
    func adViewDidReceiveAd(_ bannerView: GADBannerView) {
        adBanner.isHidden = false
    }
    func adView(_ bannerView: GADBannerView, didFailToReceiveAdWithError error: GADRequestError) {
        adBanner.isHidden = true
    }
    // Google AdMod End
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ItemCell
        configureCell(cell: cell, indexPath: indexPath as NSIndexPath)
        return cell
    }
    
    func configureCell (cell: ItemCell, indexPath: NSIndexPath){
        let item = controller.object(at: indexPath as IndexPath)
        cell.configureCell(item: item)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let objs = controller.fetchedObjects, objs.count > 0{
            let item = objs[indexPath.row]
            performSegue(withIdentifier: "ItemDetailsWebVC", sender: item)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ItemDetailsWebVC"{
            if let destination = segue.destination as? ItemDetailWebVC{
                if let item = sender as? Item{
                destination.itemToEdit = item
                }
            }
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let sections = controller.sections{
            let sectionInfo = sections[section]
            return sectionInfo.numberOfObjects
        }
        return 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if let sections = controller.sections{
            return sections.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 127
    }
    
    func attemptFetch(){
        let fetchRequest: NSFetchRequest<Item> = Item.fetchRequest()
        let dateSort = NSSortDescriptor(key: "created", ascending: false )
        let categorySort = NSSortDescriptor(key: "category", ascending: true)
        let titleSort = NSSortDescriptor(key: "title", ascending: true)
        
        if segment.selectedSegmentIndex == 0 {
            fetchRequest.sortDescriptors = [dateSort]
        } else if segment.selectedSegmentIndex == 1{
            fetchRequest.sortDescriptors = [categorySort]
        }else if segment.selectedSegmentIndex == 2{
            fetchRequest.sortDescriptors = [titleSort]
        }
        
         let controller = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        
        controller.delegate = self
        
        self.controller = controller
        
        do {
            try controller.performFetch()
            
        } catch{
            let error = error as NSError
            print("\(error)")
        }
       
    }
    
    @IBAction func sortBySegment(_ sender: Any) {
        attemptFetch()
        tableView.reloadData()
    }
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.beginUpdates()
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        
        switch(type){
        case.insert:
            if let indexPath = newIndexPath {
                tableView.insertRows(at: [indexPath], with: .fade)
            }
            break
        case.delete:
            if let indexPath = indexPath {
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
            break
        case.update:
            if let indexPath = indexPath {
            let cell = tableView.cellForRow(at: indexPath) as! ItemCell
                configureCell(cell: cell, indexPath: indexPath as NSIndexPath)
            }
            break
        case.move:
            if let indexPath = indexPath {
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
            if let indexPath = newIndexPath {
                tableView.insertRows(at: [indexPath], with: .fade)
            }
            break
        
        }
    }
    
    func generateTestData(){
        let item = Item(context: context)
        item.title = "Google"
        item.category = "Search Engine"
        item.details = "www.google.com"
        
        let item2 = Item(context: context)
        item2.title = "Apple"
        item2.category = "Apple Developer"
        item2.details = "www.apple.com"
        
        let item3 = Item(context: context)
        item3.title = "FaceBook"
        item3.category = "Social"
        item3.details = "www.facebook.com"
       
    }
    
    
    
    
}

