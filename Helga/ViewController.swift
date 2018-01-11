//
//  ViewController.swift
//  Helga
//
//  Created by Sajjad Aboutalebi on 11/8/17.
//  Copyright © 2017 Sajjad Aboutalebi. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {
    
    private var locations: Results<Location>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let realm = try! Realm()
        locations = realm.objects(Location.self)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print(locations.count)
    }

}



