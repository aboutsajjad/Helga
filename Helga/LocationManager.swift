//
//  LocationManager.swift
//  Helga
//
//  Created by Sajjad Aboutalebi on 6/8/18.
//  Copyright © 2018 Sajjad Aboutalebi. All rights reserved.
//

import UIKit
import CoreLocation

protocol LocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
}

class LocationManager: NSObject {
    var delegate: LocationManagerDelegate?
    lazy var alocationManager: CLLocationManager = {
        let manager = CLLocationManager()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyKilometer
        manager.requestAlwaysAuthorization()
        manager.pausesLocationUpdatesAutomatically = false
        manager.allowsBackgroundLocationUpdates = true
        return manager
    }()
    
    override init() {
        super.init()
        alocationManager.startUpdatingLocation()
    }
    
    func startMonitoring() {
        alocationManager.startMonitoringSignificantLocationChanges()
        
    }
    
    func restartMonitoring() {
        alocationManager.stopMonitoringSignificantLocationChanges()
        alocationManager.startMonitoringSignificantLocationChanges()
    }
}

extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        delegate?.locationManager(manager, didUpdateLocations: locations)
        for location in locations {
            print(location)
        }
    }
}
