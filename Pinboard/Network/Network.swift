//
//  Network.swift
//  Pinboard
//
//  Created by Lalson CL on 13/04/19.
//  Copyright © 2019 Lalson CL. All rights reserved.
//

import Foundation
//* swift5 Result block not needed
public enum Result<Success, Failure: Error> {
    case success(Success), failure(Failure)
}
//*

/// Network error
enum NEError: Error {
    case noNetwork(message: String, description: String)
    case invalidURL(message: String, description: String)
    case dataEmpty(message: String, description: String)
    case invalidFormat(message: String, description: String)
    case unknown(message: String, description: String)
}

/// Handle Network requesta
class Netwrok {
    
    /// Handle api calls
    /// - Parameter requestType: Specify the request for
    /// - Parameter completion: Complete with a generic result
    static func request<T: Decodable>(with requestType: Request,
                                            completion: @escaping (Result <T, NEError>) -> Void) {
        /// Verify the request
        guard let request = requestType.request else {
            // Complete with a custom message
            completion(.failure(.invalidURL(message: "Invalid URL",
                                        description: "Provide url unsatisfied, please provide a valid URL.")))
            return
        }
        
        /// Intance of session
        let session = URLSession.shared
        // Add and poll the task with a completion
        session.dataTask(with: request) { (data, response, error) in
            
            /// Returns error if any occures
            var basicError: NEError? {
                // Verify the data
                guard let _ = data else {
                    // Returns data nil error
                    return .dataEmpty(message: "Data is empty", description: "Response data is empty due to unknown reason")
                }
                
                // Verify the erro is nil
                guard error == nil else {
                    /// Parse description if available
                    let description = error?.localizedDescription ?? "Unkwon error"
                    /// Create NEError
                    let error = NEError.unknown(message: "Error", description: description)
                    // returns error
                    return error
                }
                
                /// Returns if no error found
                return nil
            }
            
            /// Verify the error
            if let _ = basicError {
                // Complete with failue
                completion(.failure(basicError!))
                return
            }
            
            do {
                /// Parse the generic model from data
                let result = try JSONDecoder().decode(T.self, from: data!)
                // Complete with success
                completion(.success(result))
            } catch let caugth {
                /// Create error
                let error = NEError.unknown(message: "Error", description: caugth.localizedDescription)
                // Complete with failure
                completion(.failure(error))
            }
        }.resume()
    }
}
