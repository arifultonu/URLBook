//
//  ItemDetailWebVC.swift
//  URLBook
//
//  Created by Ariful Tonu on 12/16/16.
//  Copyright © 2016 AndApps. All rights reserved.
//

import UIKit

class ItemDetailWebVC: UIViewController {
    
    
    @IBOutlet weak var WebView: UIWebView!
    @IBOutlet weak var ActInd: UIActivityIndicatorView!
    @IBOutlet weak var SearchBar: UISearchBar!
    
    var itemToEdit: Item?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let topNavigationItem = self.navigationController?.navigationBar.topItem {
            topNavigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
        }
        
        if itemToEdit != nil {
           loadItemData()
        }
        
    loadUrlWebView()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    func loadItemData() {
        if let item = itemToEdit {
            SearchBar.text = item.details
        }
    }
    
    func loadUrlWebView() {
        let text = SearchBar.text
        let webUrl = URL(string: text!)
        let webUrlRequest = URLRequest(url: webUrl!)
        WebView.loadRequest(webUrlRequest)
    }
    
    
    func searchBarSearchButtonClicked(_ searchbar: UISearchBar){
        searchbar.resignFirstResponder()
        let text = SearchBar.text
        let webUrl = URL(string: text!)
        let webUrlRequest = URLRequest(url: webUrl!)
        WebView.loadRequest(webUrlRequest)
    }

    func webViewDidStartLoad(_ : UIWebView) {
        ActInd.startAnimating()
    }
    
    func webViewDidFinishLoad(_ : UIWebView) {
        ActInd.stopAnimating()
    }
    
    
}
