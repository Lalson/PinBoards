//
//  Category.swift
//  Pinboard
//
//  Created by Lalson CL on 13/04/19.
//  Copyright © 2019 Lalson CL. All rights reserved.
//

import Foundation

struct Category: Codable {
    let id : Int?
    let links: Link?
    let photoCount: Int?
    let title: String?
}
