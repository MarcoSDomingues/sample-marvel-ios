//
//  LoadingSectionManager.swift
//  Marvel
//
//  Created by Marco Domingues on 08/02/2020.
//  Copyright © 2020 Marco. All rights reserved.
//

import UIKit

final class LoadingSectionManager: ListSectionManager {
    
    // MARK: - Properties
    
    var isLoading: Bool = false {
        didSet {
            contentContext.reload()
        }
    }
    
    // MARK: - ListSectionManager
    
    var contentContext: ListContentContext<ListContentManager>!
    
    func registerReuseIdentifiers(in collectionView: UICollectionView) {
        LoadingIndicatorCollectionViewCell.register(in: collectionView)
    }
    
    func sectionInset() -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0)
    }
    
    func numberOfItems() -> Int {
        return isLoading ? 1 : 0
    }
    
    func sizeForItemAt(_ index: Int) -> CGSize {
        let insets = sectionInset()
        let width = contentContext.collectionView.bounds.width - (insets.left + insets.right)
        return CGSize(width: width, height: 40)
    }
    
    func cellForItemAt(_ index: Int) -> UICollectionViewCell {
        return contentContext.dequeueReusableCell(for: index) as LoadingIndicatorCollectionViewCell
    }
    
    func shouldSelectItemAt(_ index: Int) -> Bool {
        return false
    }
    
    func didSelectItemAt(_ index: Int) {}
    
    func didDeselectItemAt(_ index: Int) {}
    
}

