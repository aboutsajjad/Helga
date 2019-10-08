//
//  MapViewController.swift
//  Helga
//
//  Created by Sajjad Aboutalebi on 6/8/18.
//  Copyright © 2018 Sajjad Aboutalebi. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class MapViewController: UIViewController {
    lazy var mapView: MKMapView = {
        let map = MKMapView(frame: view.frame)
        map.isZoomEnabled = true
        map.isScrollEnabled = true
        map.showsUserLocation = true
        map.setUserTrackingMode(MKUserTrackingMode.followWithHeading, animated: true)
        return map
    }()
    @available(iOS 11.0, *)
    lazy var userTrackingBtn: MKUserTrackingButton = {
        let btn = MKUserTrackingButton(mapView: mapView)
        btn.frame.origin = CGPoint(x: view.frame.width - btn.frame.width - 10, y: view.frame.height - btn.frame.height - 10)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        view.addSubview(mapView)
        if #available(iOS 11.0, *) {
            view.addSubview(userTrackingBtn)
        } else {
            // Fallback on earlier versions
        }
        
    }
}
extension MapViewController: LocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        for _ in locations {
        }
    }
}
