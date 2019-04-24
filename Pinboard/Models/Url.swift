//
//  Url.swift
//  Category
//
//  Created by Lalson CL on 13/04/19.
//  Copyright © 2019 Lalson CL. All rights reserved.
//

import Foundation

enum ImageType: Int {
    case full = 0
    case raw
    case regular
    case small
    case thumb
}

struct Url: Codable {
    let full: String?
    let raw: String?
    let regular: String?
    let small: String?
    let thumb: String?
    
    func imageURL(of type: ImageType) -> String? {
        switch type {
        case .full: return full
        case .raw: return raw
        case .regular: return regular
        case .small: return small
        case .thumb: return thumb
        }
    }
}
