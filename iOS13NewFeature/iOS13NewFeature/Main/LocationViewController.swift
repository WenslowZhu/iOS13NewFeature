//
//  LocationViewController.swift
//  iOS13NewFeature
//
//  Created by tstone10 on 2019/6/28.
//  Copyright © 2019 朱廷. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class LocationViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    @IBAction func startLocate(_ sender: Any) {
        manager.requestWhenInUseAuthorization()
    }
    
    let manager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        manager.delegate = self
        
        mapView.userTrackingMode = .follow
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse || status == .authorizedAlways {
            manager.startUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let coordinator = locations.last?.coordinate else {
            return
        }
        mapView.setCenter(coordinator, animated: true)
        mapView.setCameraZoomRange(MKMapView.CameraZoomRange(minCenterCoordinateDistance: 100, maxCenterCoordinateDistance: 1000), animated: true)
    }
}
