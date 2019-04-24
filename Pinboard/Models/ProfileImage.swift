//
//  ProfileImage.swift
//  Pinboard
//
//  Created by Lalson CL on 13/04/19.
//  Copyright © 2019 Lalson CL. All rights reserved.
//

import Foundation

struct ProfileImage: Codable {
    let large: String?
    let medium: String?
    let small: String?
    
    func imageURL(of type: ImageType) -> String? {
        switch type {
        case .full,
             .raw: return large
        case .regular: return medium
        case .small,
             .thumb: return small
        }
    }
}
