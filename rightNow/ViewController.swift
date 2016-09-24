//
//  ViewController.swift
//  rightNow
//
//  Created by Scott Lehman on 9/24/16.
//  Copyright © 2016 Scott Lehman. All rights reserved.
//

import UIKit
import GoogleMaps

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let camera = GMSCameraPosition.camera(withLatitude: -33.868,
                                                          longitude:151.2086, zoom:6)
        let rect = CGRect(x: 0, y: 0, width: 0, height: 0)
        let mapView = GMSMapView.map(withFrame: rect, camera:camera)
        
        let marker = GMSMarker()
        marker.position = camera.target
        marker.snippet = "Hello World"
        marker.appearAnimation = kGMSMarkerAnimationPop
        marker.map = mapView
        
        self.view = mapView
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

