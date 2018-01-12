//
//  ClusterViewController.swift
//  Helga
//
//  Created by Sajjad Aboutalebi on 1/12/18.
//  Copyright © 2018 Sajjad Aboutalebi. All rights reserved.
//

import UIKit
import GoogleMaps
import RealmSwift

class ClusterViewController: UIViewController, GMUClusterManagerDelegate, GMSMapViewDelegate  {

    private var mapView: GMSMapView!
    private var clusterManager: GMUClusterManager!
    
    var locations: Results<Location>! {
        let realm = try! Realm()
        return realm.objects(Location.self).sorted(byKeyPath: "timestamp", ascending: false)
    }
    
    
    let kCameraLatitude = 35.7955
    let kCameraLongitude = 51.4433
    
    override func loadView() {
        let camera = GMSCameraPosition.camera(withLatitude: kCameraLatitude,
                                              longitude: kCameraLongitude, zoom: 10)
        mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.settings.myLocationButton = true
        mapView.isMyLocationEnabled = true
        mapView.settings.compassButton = true
        
        self.view = mapView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let iconGenerator = GMUDefaultClusterIconGenerator()
        let algorithm = GMUNonHierarchicalDistanceBasedAlgorithm()
        let renderer = GMUDefaultClusterRenderer(mapView: mapView,
                                                 clusterIconGenerator: iconGenerator)
        clusterManager = GMUClusterManager(map: mapView, algorithm: algorithm,
                                           renderer: renderer)
        
        addClusterItems()
        
        clusterManager.cluster()
        clusterManager.setDelegate(self, mapDelegate: self)
    }

    // MARK: - GMUClusterManagerDelegate
    
    private func clusterManager(clusterManager: GMUClusterManager, didTapCluster cluster: GMUCluster) {
        let newCamera = GMSCameraPosition.camera(withTarget: cluster.position,
                                                           zoom: mapView.camera.zoom + 1)
        let update = GMSCameraUpdate.setCamera(newCamera)
        mapView.moveCamera(update)
    }
    
    // MARK: - GMUMapViewDelegate
    
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        if let poiItem = marker.userData as? POIItem {
            NSLog("Did tap marker for cluster item \(poiItem.name)")
        } else {
            NSLog("Did tap a normal marker")
        }
        return false
    }
    
    private func addClusterItems() {
        
        for location in locations {
            let item = POIItem(position: CLLocationCoordinate2DMake(location.latitude, location.longitude), name: location.timestamp)
            clusterManager.add(item)
        }
    }
}
