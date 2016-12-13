//
//  MainVC.swift
//  URLBook
//
//  Created by Ariful Tonu on 11/11/16.
//  Copyright © 2016 AndApps. All rights reserved.
//

import UIKit
import GoogleMobileAds

class MainVC: UIViewController, GADBannerViewDelegate{

    @IBOutlet weak var adBanner: GADBannerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        adBanner.isHidden = true
        adBanner.delegate = self
        
        adBanner.adUnitID = "ca-app-pub-2520008502309661/1381129637"
        adBanner.rootViewController = self
        //adBanner.load(<#T##request: GADRequest?##GADRequest?#>)
        let request = GADRequest()
        adBanner.load(request)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func adViewDidReceiveAd(_ bannerView: GADBannerView) {
        adBanner.isHidden = false
    }
    
    func adView(_ bannerView: GADBannerView, didFailToReceiveAdWithError error: GADRequestError) {
        adBanner.isHidden = true
    }
}

