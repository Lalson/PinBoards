//
//  Request.swift
//  Pinboard
//
//  Created by Lalson CL on 13/04/19.
//  Copyright © 2019 Lalson CL. All rights reserved.
//

import Foundation

typealias Header    = [String: String]
typealias Parameter = Header

enum HTTPMethod: String {
    case get    = "GET"
    case post   = "POST"
    case put    = "PUT"
    case delete = "DELETE"
}

/// Request Endpoint
protocol Endpoint {
    /// Specify path
    var path: String { get }
    /// Specify method
    var method: HTTPMethod { get }
    /// Specify parameter
    var parameter: Parameter { get }
    /// Specify header
    var header: Header { get }
}

/// Define the request
enum Request: Endpoint {
    case pinboardList
    case dynamic(String)
    case image(String)
    
    var path: String {
        switch self {
        case .pinboardList: return "https://pastebin.com/raw/wgkJgazE"
        case .dynamic(let url): return url
        case .image(let imageURL): return imageURL
        }
    }
    
    var method: HTTPMethod { return .get }
    var parameter: Parameter { return [:] }
    var header: Header { return [:] }
    
    /// Return request
    var request: URLRequest? {
        /// Verify URL
        guard let url = URL(string: path) else { return nil }
        /// Initailize request
        var request = URLRequest(url: url)
        // Set HTTP Method
        request.httpMethod = method.rawValue
        // Set HTTP Body
        request.httpBody = try? JSONEncoder().encode(parameter)
        // Set HTTP Header
        request.allHTTPHeaderFields = header
        // returns request
        return request
    }
}
