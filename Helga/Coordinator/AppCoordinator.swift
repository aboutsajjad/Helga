//
//  AppCoordinator.swift
//  Helga
//
//  Created by Sajjad Aboutalebi on 6/8/18.
//  Copyright © 2018 Sajjad Aboutalebi. All rights reserved.
//

import UIKit

class AppCoordinator: Coordinator {
    let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let mapCoordinator = MapCoordinator(window: window)
        mapCoordinator.start()
        
    }
}
