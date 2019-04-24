//
//  DataSourceAndDelegate.swift
//  Pinboard
//
//  Created by Lalson CL on 13/04/19.
//  Copyright © 2019 Lalson CL. All rights reserved.
//

import UIKit

/// Handle a generic collection for lists 
protocol DataSourceAndDelegate {
    associatedtype Item
    var items: [Item] { get }
    // Returns number items in section
    func numberOfItems(in section: Int) -> Int
    // Returns item at indexpath
    func item(at indexPath: IndexPath) -> Item
    // Returns default cell size
    func sizeForItem(at indexPath: IndexPath) -> CGSize
}

extension DataSourceAndDelegate {
    func numberOfItems(in section: Int) -> Int {
        return items.count
    }
    
    func item(at indexPath: IndexPath) -> Item {
        return items[indexPath.row]
    }
    
    func sizeForItem(at indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
}
