//
//  UIExtensions.swift
//  Pinboard
//
//  Created by Lalson CL on 13/04/19.
//  Copyright © 2019 Lalson CL. All rights reserved.
//

import UIKit

/// Stors images in cache 
let imageCache = NSCache<AnyObject, AnyObject>()

extension UIImageView {
    
    func load(image url: String) {
        // Verify the url
        guard !url.isEmpty else { return }
        /// Parse URL from url string
        let url = URL(string: url)
        // Set placeholder image
        image = UIImage(named: "newsPlaceholder")
        /// Get image from cache if available
        if let imageFromCache = imageCache.object(forKey: url as AnyObject) as? UIImage {
            // Set image
            self.image = imageFromCache
            return
        }
        
        // Fetch image from external world
        URLSession.shared.dataTask(with: url!) { data, _, _ in
            // Verify the data
            guard data != nil,
                 !data!.isEmpty else { return }
            // Execute on main
            viaMain {
                /// Get image
                if let imageToCache = UIImage(data: data!) {
                /// Save to cache
                imageCache.setObject(imageToCache, forKey: url as AnyObject)
                // Set image
                self.image = imageToCache
            }
            }
            // Resume the task
            }.resume()
    }
}

extension UIView {
    /// Add gradient layer to view
    func addGradient() {
        /// Initialize gardient layer
        let gradient = CAGradientLayer()
        // Specify colors
        gradient.colors = [UIColor(named: "Green")?.cgColor,
                           UIColor(named: "Blue")?.cgColor] as? [CGColor]
        // Specify gradient start point
        gradient.startPoint = CGPoint(x: 0.0, y: 1.0)
        // Specify gradient end point
        gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
        // Set gradient boundary
        gradient.frame = bounds
        // Add layer to current view
        self.layer.insertSublayer(gradient, at: 0)
    }
}

/// A bypass for main queue
func viaMain(_ completion: @escaping () -> Void) {
    DispatchQueue.main.async { completion() }
}
