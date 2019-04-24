//
//  AppDelegate.swift
//  Pinboard
//
//  Created by Lalson CL on 13/04/19.
//  Copyright © 2019 Lalson CL. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        // Set initial navigation
        setNavigation()
        return true
    }
    
    /// Set initial navigation
    private func setNavigation() {
        /// Initialize Pinboard View
        let pinboard = PinboardView.instantiate()
        /// Initialize Pinboard ViewModel with Pinboard Type
        let viewModel = PinboardViewModel<Pinboard>()
        // Set the view model to view
        pinboard.viewModel = viewModel
        /// Initialize Navigation Controller with Root View Controller as Pinboard
        let navigationController = UINavigationController(rootViewController: pinboard)
        /// Initialize window with frame
        window = UIWindow(frame: UIScreen.main.bounds)
        // Set the navigation controller
        window?.rootViewController = navigationController
        // Set the key window visible
        window?.makeKeyAndVisible()
    }
}

