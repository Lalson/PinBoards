//
//  PinboardViewModel.swift
//  Pinboard
//
//  Created by Lalson CL on 13/04/19.
//  Copyright © 2019 Lalson CL. All rights reserved.
//

import Foundation

class PinboardViewModel<Item> {
    /// Instance of pinboard array
    private var pinboards: [Item] = []
    /// ViewModel view update binder
    var reload: (() -> Void)?
    
    /// Initialize Pinboard View Model with pinboard list fetch
    init() { fetchPinboardList() }
    
    /// Fetch pinboard list.
    func fetchPinboardList() {
        // Request to network
        Netwrok.request(with: .pinboardList, completion: pinboardList)
    }
    
    /// Result of pinboard list, both success and failure.
    /// Using Result type param.
    /// - Parameter result: Please specify the success and failure model.
    private func pinboardList(new result: Result<[Pinboard], NEError>) {
        // Seperate results
        switch result {
            // Handle success
        case .success(let pinboards):
            // Set pinboard array
            self.pinboards = pinboards as? [Item] ?? []
            // Reload collection view via binder in main queue
            viaMain { self.reload?() }
            
            // Handle error
        case .failure(let error):
            /// print error message
            print(error)
        }
    }
}

extension PinboardViewModel: DataSourceAndDelegate {
    var items: [Item] { return pinboards }
}

extension PinboardViewModel {
    /// Cast and returns Pinboard
    func pinboard(at indexPath: IndexPath) -> Pinboard? {
        /// Verify picboard
        guard let pinboard = item(at: indexPath) as? Pinboard else { return nil }
        // Returns pinboard
        return pinboard
    }
}
