//
//  LocationManager.swift
//  Helga
//
//  Created by Sajjad Aboutalebi on 12/4/17.
//  Copyright © 2017 Sajjad Aboutalebi. All rights reserved.
//

import UIKit
import CoreLocation
import SwiftyJSON

class LocationManager: NSObject, CLLocationManagerDelegate {
    static let shared = LocationManager()
    var alocationmanager: CLLocationManager
    var glocations: [CLLocation] = []
    var terminated = false
    var locations: [JSON] = []
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
    
    func saveFromBackground()  {
        terminated = true
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        glocations = []
        glocations = locations
        //print(UIApplication.shared.applicationState)
        for location in locations {
            print(location)
            //write(location: location)
        }
    }
    
    func write(location: CLLocation) {
        let currentDateTime = Date()
        let formatter = DateFormatter()
        formatter.timeStyle = .medium
        formatter.dateStyle = .long
        
        var json = JSON()
        json["latitude"].double =  location.coordinate.latitude
        json["longitude"].double =  location.coordinate.longitude
        json["timestamp"].string = "\(location.timestamp)"
        locations.append(json)
        print(locations.count)
        
        
        
    }
    
}
