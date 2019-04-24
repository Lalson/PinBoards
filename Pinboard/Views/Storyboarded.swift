//
//  Storyboarded.swift
//  Pinboard
//
//  Created by Lalson CL on 13/04/19.
//  Copyright © 2019 Lalson CL. All rights reserved.
//

import UIKit

/*
 * This will initialize view controller from storyboard.
 */
protocol Storyboarded {
    /**
     - To make view controller easier to instantiate from storyboard.
     - The storyboard ID must match its class name.
     - Returns: Returns the type that conforms
     */
    static func instantiate() -> Self
}


/// This extension will enable, when the where condition satisfy the type
extension Storyboarded where Self: UIViewController {
    
    static func instantiate() -> Self {
        /// Get the string representation of the view controller
        let id = String(describing: self)
        /// Get the Main storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        /// Returns the view controller
        return storyboard.instantiateViewController(withIdentifier: id) as! Self
    }
}
