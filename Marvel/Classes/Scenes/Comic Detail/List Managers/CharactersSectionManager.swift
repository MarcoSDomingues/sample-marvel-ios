//
//  CharactersSectionManager.swift
//  Marvel
//
//  Created by Marco Domingues on 10/02/2020.
//  Copyright © 2020 Marco. All rights reserved.
//

import UIKit

final class CharactersSectionManager: ListSectionManager {
    
    // MARK: - Properties
    
    var characters: [CharacterViewModel] = [] {
        didSet {
            contentContext.reload()
        }
    }
    
    // MARK: - ListSectionManager
    
    var contentContext: ListContentContext<ListContentManager>!
    
    func registerReuseIdentifiers(in collectionView: UICollectionView) {
        CharacterCollectionViewCell.register(in: collectionView)
    }
    
    func sectionInset() -> UIEdgeInsets {
        return UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)
    }
    
    func numberOfItems() -> Int {
        return characters.count
    }
    
    func sizeForItemAt(_ index: Int) -> CGSize {
        let insets = sectionInset()
        let width = contentContext.collectionView.bounds.width - (insets.left + insets.right)
        return CGSize(width: width, height: 100)
    }
    
    func cellForItemAt(_ index: Int) -> UICollectionViewCell {
        let cell = contentContext.dequeueReusableCell(for: index) as CharacterCollectionViewCell
        cell.item = characters[index]
        return cell
    }
    
    func shouldSelectItemAt(_ index: Int) -> Bool {
        return false
    }
    
    func didSelectItemAt(_ index: Int) {}
    
    func didDeselectItemAt(_ index: Int) {}
    
}
