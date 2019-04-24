//
//  PinboardCell.swift
//  Pinboard
//
//  Created by Lalson CL on 13/04/19.
//  Copyright © 2019 Lalson CL. All rights reserved.
//

import UIKit

fileprivate extension String {
    /// Returns string format of date
    var formatted: String? {
        /// Initialize date formatter
        let formatter = DateFormatter()
        // Set the date format
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        /// Parse date from string
        guard let date = formatter.date(from: self) else { return nil }
        // Change out put date format
        formatter.dateFormat = "MMM dd,yyyy"
        // return date string from data
        return formatter.string(from: date)
    }
}

class PinboardCell: UICollectionViewCell {
    
    /// Set pinbord object for cell view update
    var pinboard: Pinboard? {
        didSet {
            /// Verify pinboard
            guard let pinboard = pinboard else { return }
            /// Verify the image urls
            if let urls = pinboard.urls,
            /// Verify the raw image URL
               let imageURL = urls.imageURL(of: ImageType(rawValue: 2)!) {
                // Fetch and update image
                imageView.load(image: imageURL)
            }
            
            /// Verify the created time
            if let created = pinboard.createdAt {
            /// Create attributted date string
               let attributtedStringWithDate = NSMutableAttributedString(string: created.formatted ?? "",
                                                                     attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16)])
                /// Create attributted like string
                let likes = NSAttributedString(string: "\n\(pinboard.likes ?? 0) Likes")
                // Append likes
                attributtedStringWithDate.append(likes)
                
                /// Verify User
                if let user = pinboard.user,
                /// Verify User Name
                    let name = user.name {
                    /// Create attributted profile name
                    let profileName = NSAttributedString(string: "\nBy " + name)
                    // Append profile name
                    attributtedStringWithDate.append(profileName)
                }
                // Set attributted string decription view
                photoDescriptionTextView.attributedText = attributtedStringWithDate
            }
        }
    }
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var photoDescriptionTextView: UITextView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
