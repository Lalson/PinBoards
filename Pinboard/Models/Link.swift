//
//  Link.swift
//  Pinboard
//
//  Created by Lalson CL on 13/04/19.
//  Copyright © 2019 Lalson CL. All rights reserved.
//

import Foundation

struct Link: Codable {
    let photos: String?
    let mine: String?

    enum CodingKeys: String, CodingKey {
            case photos = "photos"
            case mine   = "self"
    }
}
