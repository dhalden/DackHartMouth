//
//  ViewController.swift
//  rightNow
//
//  Created by Scott Lehman on 9/24/16.
//  Copyright © 2016 Scott Lehman. All rights reserved.
//

import UIKit
import GoogleMaps
import GoogleMapsCore

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet var mview: GMSMapView!
    let locationManager = CLLocationManager()
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.locationManager.requestAlwaysAuthorization()
        self.locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
        
        let camera = GMSCameraPosition.camera(withLatitude: 0,
                                                          longitude:0, zoom:0)
        let rect = CGRect(x: 0, y: 0, width: 0, height: 0)
        let mapView = GMSMapView.map(withFrame: rect, camera:camera)
        mapView.isMyLocationEnabled = true
        if(mapView.isMyLocationEnabled) {
            self.mview = mapView
        } else {
            self.mview = mapView
        }
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    func locationManager(_ manager:CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let locValue:CLLocationCoordinate2D = manager.location!.coordinate
        self.mview.isMyLocationEnabled = true
        print("locations = \(locValue.latitude) \(locValue.longitude)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

