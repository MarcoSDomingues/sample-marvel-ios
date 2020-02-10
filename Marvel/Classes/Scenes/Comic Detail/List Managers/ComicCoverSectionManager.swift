//
//  ComicCoverSectionManager.swift
//  Marvel
//
//  Created by Marco Domingues on 09/02/2020.
//  Copyright © 2020 Marco. All rights reserved.
//

import UIKit

final class ComicCoverSectionManager: ListSectionManager {
    
    // MARK: - Properties
    
    typealias SelectionActionBlock = (ComicViewModel) -> Void
    var onSelectionActionBlock: SelectionActionBlock?
    
    var comic: ComicViewModel {
        didSet {
            contentContext.reload()
        }
    }
    
    // MARK: - Initialization
    
    init(comic: ComicViewModel) {
        self.comic = comic
    }
    
    // MARK: - ListSectionManager
    
    var contentContext: ListContentContext<ListContentManager>!
    
    func registerReuseIdentifiers(in collectionView: UICollectionView) {
        CoverCollectionViewCell.register(in: collectionView)
    }
    
    func sectionInset() -> UIEdgeInsets {
        return .zero
    }
    
    func numberOfItems() -> Int {
        return 1
    }
    
    func sizeForItemAt(_ index: Int) -> CGSize {
        let insets = sectionInset()
        let width = contentContext.collectionView.bounds.width - (insets.left + insets.right)
        return CGSize(width: width, height: 300)
    }
    
    func cellForItemAt(_ index: Int) -> UICollectionViewCell {
        let cell = contentContext.dequeueReusableCell(for: index) as CoverCollectionViewCell
        cell.item = comic
        return cell
    }
    
    func shouldSelectItemAt(_ index: Int) -> Bool {
        return true
    }
    
    func didSelectItemAt(_ index: Int) {
        onSelectionActionBlock?(comic)
    }
    
    func didDeselectItemAt(_ index: Int) {}
    
}
