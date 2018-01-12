//
//  Location.swift
//  Helga
//
//  Created by Sajjad Aboutalebi on 1/11/18.
//  Copyright © 2018 Sajjad Aboutalebi. All rights reserved.
//

import Foundation
import RealmSwift


class Location: Object {
    @objc dynamic var latitude: Double = 0.0
    @objc dynamic var longitude: Double = 0.0
    @objc dynamic var time = ""
    @objc dynamic var date = ""
    @objc dynamic var timestamp = ""
}



