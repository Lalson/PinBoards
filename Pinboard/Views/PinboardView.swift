//
//  PinboardView.swift
//  Pinboard
//
//  Created by Lalson CL on 13/04/19.
//  Copyright © 2019 Lalson CL. All rights reserved.
//

import UIKit

class PinboardView: UIViewController, Storyboarded {
    /// Instance of Pinboard View Model
    var viewModel: PinboardViewModel<Pinboard>!
    
    @IBOutlet private weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Set navigation title
        navigationItem.title = "Pinboard"
        // Set gradient for view
        view.addGradient()
        // Listen viewmodel binder
        viewModel?.reload = { [weak self] in
            /// Reload collection
            self?.collectionView.reloadData()
        }
    }
}

/// Handle collection view delegates
extension PinboardView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItems(in: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        /// Initialize Pinboard cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PinboardCell
        /// Fetch pinboard at indexpath
        let pinboard = viewModel.pinboard(at: indexPath)
        // Set the pinboard to cell
        cell.pinboard = pinboard
        return cell
    }
    
}

extension PinboardView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        /// Store size of collection view frame
        let size = collectionView.frame.size
        /// Calculate and store cell height
        let height = size.height / 2
        /// Store the width
        let width = size.width
        /// Returns cell height
        return CGSize(width: width, height: height)
    }
}

