//
//  ClusterViewController.swift
//  Helga
//
//  Created by Sajjad Aboutalebi on 1/12/18.
//  Copyright © 2018 Sajjad Aboutalebi. All rights reserved.
//

import UIKit
import RealmSwift
import MapKit

class ClusterViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    
    var locations: Results<Location>! {
        let realm = try! Realm()
        return realm.objects(Location.self).sorted(byKeyPath: "timestamp", ascending: false)
    }
    
    func setupUserTrackingButtonAndScaleView() {
        mapView.showsUserLocation = true
        
        let button = MKUserTrackingButton(mapView: mapView)
        button.layer.backgroundColor = UIColor(white: 1, alpha: 0.8).cgColor
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)
        
        let scale = MKScaleView(mapView: mapView)
        scale.legendAlignment = .trailing
        scale.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scale)
        
        NSLayoutConstraint.activate([button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10),
                                     button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
                                     scale.trailingAnchor.constraint(equalTo: button.leadingAnchor, constant: -10),
                                     scale.centerYAnchor.constraint(equalTo: button.centerYAnchor)])
    }
    
    
    
    func loadDataForMapRegionAndBikes() {
        let points: [MKPointAnnotation] = locations.map { location -> MKPointAnnotation in
            let bike = MKPointAnnotation()
            bike.coordinate = CLLocationCoordinate2DMake(location.latitude, location.longitude)
            return bike
        }
         mapView.addAnnotations(points)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUserTrackingButtonAndScaleView()
        loadDataForMapRegionAndBikes()
    }
    
}
