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
    
    private let numberOfColumns: Int = 3
    
    private var minimumInteritemSpacing: CGFloat {
        guard let layout = contentContext.layout as? UICollectionViewFlowLayout else {
            return 0.0
        }
        return layout.minimumInteritemSpacing
    }
    
    // MARK: - ListSectionManager
    
    var contentContext: ListContentContext<ListContentManager>!
    
    func registerReuseIdentifiers(in collectionView: UICollectionView) {
        ComicCollectionViewCell.register(in: collectionView)
    }
    
    func sectionInset() -> UIEdgeInsets {
        return .zero
    }
    
    func numberOfItems() -> Int {
        return comics.count
    }
    
    func sizeForItemAt(_ index: Int) -> CGSize {
        let insets = sectionInset()
        var width = contentContext.collectionView.bounds.width - (insets.left + insets.right)
        width -= (CGFloat(numberOfColumns - 1) * minimumInteritemSpacing)
        let itemWidth = width / CGFloat(numberOfColumns)
        return CGSize(width: itemWidth, height: 200)
    }
    
    func cellForItemAt(_ index: Int) -> UICollectionViewCell {
        let cell = contentContext.dequeueReusableCell(for: index) as ComicCollectionViewCell
        cell.item = comics[index]
        return cell
    }
    
    func shouldSelectItemAt(_ index: Int) -> Bool {
        return true
    }
    
    func didSelectItemAt(_ index: Int) {}
    
    func didDeselectItemAt(_ index: Int) {}
    
}
