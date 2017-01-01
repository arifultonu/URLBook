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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        if let topNavigationItem = self.navigationController?.navigationBar.topItem {
//            topNavigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
//        }
        
       SearchBar.text = "http://"
        
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
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
