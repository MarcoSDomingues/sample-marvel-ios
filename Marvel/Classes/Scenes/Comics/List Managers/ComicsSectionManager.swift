//
//  ComicsSectionManager.swift
//  Marvel
//
//  Created by Marco Domingues on 04/02/2020.
//  Copyright © 2020 Marco. All rights reserved.
//

import UIKit

final class ComicsSectionManager: ListSectionManager {
    
    var comics: [ComicViewModel] = [] {
        didSet {
            contentContext.reload()
        }
    }
    
    // MARK: - ListSectionManager
    
    var contentContext: ListContentContext<ListContentManager>!
    
    func registerReuseIdentifiers(in collectionView: UICollectionView) {
        UICollectionViewCell.register(in: collectionView)
    }
    
    func sectionInset() -> UIEdgeInsets {
        return .zero
    }
    
    func numberOfItems() -> Int {
        return comics.count
    }
    
    func sizeForItemAt(_ index: Int) -> CGSize {
        let insets = sectionInset()
        let width = contentContext.collectionView.bounds.width - (insets.left + insets.right)
        return CGSize(width: width, height: 200)
    }
    
    func cellForItemAt(_ index: Int) -> UICollectionViewCell {
        let cell = contentContext.dequeueReusableCell(for: index)
        cell.backgroundColor = .white
        return cell
    }
    
    func shouldSelectItemAt(_ index: Int) -> Bool {
        return true
    }
    
    func didSelectItemAt(_ index: Int) {}
    
    func didDeselectItemAt(_ index: Int) {}
    
}
