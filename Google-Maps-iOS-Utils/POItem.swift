//
//  POItem.swift
//  Helga
//
//  Created by Sajjad Aboutalebi on 1/12/18.
//  Copyright © 2018 Sajjad Aboutalebi. All rights reserved.
//

import Foundation

class POIItem: NSObject, GMUClusterItem {
    var position: CLLocationCoordinate2D
    var name: String!
    
    init(position: CLLocationCoordinate2D, name: String) {
        self.position = position
        self.name = name
    }
}
