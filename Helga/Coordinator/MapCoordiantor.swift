//
//  MapCoordiantor.swift
//  Helga
//
//  Created by Sajjad Aboutalebi on 6/8/18.
//  Copyright © 2018 Sajjad Aboutalebi. All rights reserved.
//

import UIKit

class MapCoordinator: Coordinator {
    
    private let presenter: UINavigationController
    private var window: UIWindow
    private var mapViewController: MapViewController
    init(window: UIWindow) {
        self.presenter = UINavigationController()
        self.window = window
        self.window.rootViewController = presenter
        self.window.makeKeyAndVisible()
        mapViewController = MapViewController()

    }
    func start() {
        self.presenter.pushViewController(mapViewController, animated: true)
        
    }
}
