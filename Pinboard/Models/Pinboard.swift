//
//  Pinboard.swift
//  Pinboard
//
//  Created by Lalson CL on 13/04/19.
//  Copyright © 2019 Lalson CL. All rights reserved.
//

import Foundation

struct Pinboard: Codable {

    let categories: [Category]?  
    let color: String?
    let createdAt: String?
    let height: Int?
    let id: String?
    let likedByUser: Bool?
    let likes: Int?
    let links: Link?
    let urls: Url?
    let user: User?
    let width: Int?

    enum CodingKeys: String, CodingKey {
        case categories             = "categories",
             color                  = "color",
             createdAt              = "created_at",
             height                 = "height",
             id                     = "id",
             likedByUser            = "liked_by_user",
             likes                  = "likes",
             links                  = "links",
             urls                   = "urls",
             user                   = "user",
             width                  = "width"
    }
}
