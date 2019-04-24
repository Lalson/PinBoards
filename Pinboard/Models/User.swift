//
//  User.swift
//  Category
//
//  Created by Lalson CL on 13/04/19.
//  Copyright © 2019 Lalson CL. All rights reserved.
//

import Foundation

struct User: Codable {

    let id: String?
    let links: Link?
    let name: String?
    let profileImage: ProfileImage?
    let username: String?

    enum CodingKeys: String, CodingKey {
            case id = "id"
            case links = "links"
            case name = "name"
            case profileImage = "profile_image"
            case username = "username"
    }
}
