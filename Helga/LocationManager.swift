//
//  LocationManager.swift
//  Helga
//
//  Created by Sajjad Aboutalebi on 12/4/17.
//  Copyright © 2017 Sajjad Aboutalebi. All rights reserved.
//

import UIKit
import CoreLocation

class LocationManager: NSObject, CLLocationManagerDelegate {
    static let shared = LocationManager()
    var alocationmanager: CLLocationManager
    
    override init() {
        alocationmanager = CLLocationManager()
        super.init()
        alocationmanager.delegate = self
        alocationmanager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        alocationmanager.requestAlwaysAuthorization()
        alocationmanager.pausesLocationUpdatesAutomatically = false
        alocationmanager.allowsBackgroundLocationUpdates = true
        alocationmanager.startUpdatingLocation()
    }
    
    func startmonitoring() {
        alocationmanager.startMonitoringSignificantLocationChanges()
    }
    
    func restartmonitoring() {
        alocationmanager.stopMonitoringSignificantLocationChanges()
        alocationmanager.startMonitoringSignificantLocationChanges()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(UIApplication.shared.applicationState)
        print(locations[0])
    }
    
}
