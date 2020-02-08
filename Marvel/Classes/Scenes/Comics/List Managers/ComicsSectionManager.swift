//
//  ComicsSectionManager.swift
//  Marvel
//
//  Created by Marco Domingues on 04/02/2020.
//  Copyright © 2020 Marco. All rights reserved.
//

import UIKit

final class ComicsSectionManager: ListSectionManager {
    
    enum Constants {
        static let margin: CGFloat = 12.0
        static let aspectRatio: CGFloat = 16/9
    }
    
    // MARK: - Properties
    
    let columns: Int
    
    var comics: [ComicViewModel] = [] {
        didSet {
            contentContext.reload()
        }
    }
    
    private var minimumInteritemSpacing: CGFloat {
        guard let layout = contentContext.layout as? UICollectionViewFlowLayout else {
            return 0.0
        }
        return layout.minimumInteritemSpacing
    }
    
    // MARK: - Initialization
    
    init(columns: Int) {
        self.columns = columns
    }
    
    // MARK: - ListSectionManager
    
    var contentContext: ListContentContext<ListContentManager>!
    
    func registerReuseIdentifiers(in collectionView: UICollectionView) {
        ComicCollectionViewCell.register(in: collectionView)
    }
    
    func sectionInset() -> UIEdgeInsets {
        let margin = Constants.margin
        return UIEdgeInsets(top: margin, left: margin, bottom: margin, right: margin)
    }
    
    func numberOfItems() -> Int {
        return comics.count
    }
    
    func sizeForItemAt(_ index: Int) -> CGSize {
        let insets = sectionInset()
        let columns = CGFloat(self.columns)
        var width = contentContext.collectionView.bounds.width - (insets.left + insets.right)
        width -= (columns - 1) * minimumInteritemSpacing
        let itemWidth = width / columns
        let height = itemWidth * Constants.aspectRatio
        return CGSize(width: itemWidth, height: height)
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
