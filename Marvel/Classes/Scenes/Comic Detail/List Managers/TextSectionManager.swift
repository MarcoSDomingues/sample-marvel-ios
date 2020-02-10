//
//  TextSectionManager.swift
//  Marvel
//
//  Created by Marco Domingues on 10/02/2020.
//  Copyright © 2020 Marco. All rights reserved.
//

import UIKit

final class TextSectionManager: ListSectionManager {
    
    // MARK: - Properties
    
    var textModel: TextViewModel {
        didSet {
            contentContext.reload()
        }
    }
    
    // MARK: - Initialization
    
    init(textModel: TextViewModel) {
        self.textModel = textModel
    }
    
    // MARK: - ListSectionManager
    
    var contentContext: ListContentContext<ListContentManager>!
    
    func registerReuseIdentifiers(in collectionView: UICollectionView) {
        TextCollectionViewCell.register(in: collectionView)
    }
    
    func sectionInset() -> UIEdgeInsets {
        return UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)
    }
    
    func numberOfItems() -> Int {
        return textModel.text != nil ? 1 : 0
    }
    
    func sizeForItemAt(_ index: Int) -> CGSize {
        let insets = sectionInset()
        let width = contentContext.collectionView.bounds.width - (insets.left + insets.right)
        let height = TextCollectionViewCell.textHeight(textModel.text,
                                                       width: width,
                                                       attributes: textModel.attributes)
        return CGSize(width: width, height: height)
    }
    
    func cellForItemAt(_ index: Int) -> UICollectionViewCell {
        let cell = contentContext.dequeueReusableCell(for: index) as TextCollectionViewCell
        cell.item = textModel
        return cell
    }
    
    func shouldSelectItemAt(_ index: Int) -> Bool {
        return false
    }
    
    func didSelectItemAt(_ index: Int) {}
    
    func didDeselectItemAt(_ index: Int) {}
    
}
