//
//  LocationManager.swift
//  Helga
//
//  Created by Sajjad Aboutalebi on 12/4/17.
//  Copyright © 2017 Sajjad Aboutalebi. All rights reserved.
//

import UIKit
import CoreLocation
import RealmSwift



class LocationManager: NSObject, CLLocationManagerDelegate {
    static let shared = LocationManager()
    var alocationmanager: CLLocationManager
    var glocations: [CLLocation] = []
    var significantLocationChanges = false
    
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
        significantLocationChanges = true
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        glocations = []
        glocations = locations
        for location in locations {
            print(location)
            write(location: location)
        }
    }
   
    func write(location: CLLocation) {
        let takeout = Location()
        takeout.latitude = location.coordinate.latitude
        takeout.longitude = location.coordinate.longitude
        takeout.time = DateFormatter.localizedString(from: Date(), dateStyle: .none, timeStyle: .long)
        takeout.date = DateFormatter.localizedString(from: Date(), dateStyle: .long, timeStyle: .none)
        takeout.timestamp = DateFormatter.localizedString(from: Date(), dateStyle: .medium, timeStyle: .medium)
        
        let realm = try! Realm()
        try! realm.write {
            realm.add(takeout)
        }
    }
    
}
