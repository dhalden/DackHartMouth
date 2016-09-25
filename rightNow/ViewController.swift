//
//  ViewController.swift
//  rightNow
//
//  Created by Scott Lehman on 9/24/16.
//  Copyright © 2016 Scott Lehman. All rights reserved.
//

import UIKit
import GoogleMaps
import MapKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    let locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.locationManager.requestAlwaysAuthorization()
        self.locationManager.requestWhenInUseAuthorization()
        
        // Ask for Authorisation from the User.
        self.locationManager.requestAlwaysAuthorization()
        
        // For use in foreground
        self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
    }
    
    @IBOutlet var mainview: UIView!
    @IBOutlet weak var mview: GMSMapView!
    func locationManager(_ manager:CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let locValue:CLLocationCoordinate2D = manager.location!.coordinate
        let camera = GMSCameraPosition.camera(withLatitude: locValue.latitude, longitude:locValue.longitude, zoom:6)
        
        let rect = CGRect(x: 0, y: 0, width: 0, height: 0)
        let mapView = GMSMapView.map(withFrame: rect, camera:camera)
        
        let marker = GMSMarker()
        marker.position = camera.target
        marker.snippet = "Hello World"
        marker.appearAnimation = kGMSMarkerAnimationPop
        marker.map = mapView
        super.view = mapView

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


