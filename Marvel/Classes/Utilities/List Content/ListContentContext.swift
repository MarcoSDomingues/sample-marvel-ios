//
//  ListContentContext.swift
//  Marvel
//
//  Created by Marco Domingues on 04/02/2020.
//  Copyright © 2020 Marco. All rights reserved.
//

import UIKit

struct ListContentContext<T: ListContentManager> {
    fileprivate weak var contentManager: T!
    fileprivate var sectionIndex: Int
    init(_ contentManager: T, sectionIndex: Int) {
        self.contentManager = contentManager
        self.sectionIndex = sectionIndex
    }
    
    var collectionView: UICollectionView {
        return contentManager.managedCollectionView
    }
    
    func dequeueReusableCell(withReuseIdentifier identifier: String, for index: Int) -> UICollectionViewCell {
        let indexPath = IndexPath(item: index, section: sectionIndex)
        return contentManager.managedCollectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath)
    }
    func dequeueReusableCell<Cell>(for index: Int) -> Cell where Cell: UICollectionViewCell {
        let indexPath = IndexPath(item: index, section: sectionIndex)
        return Cell.dequeue(from: contentManager.managedCollectionView, for: indexPath)
    }
    
    func reload() {
        let section = IndexSet(integer: sectionIndex)
        contentManager.managedCollectionView.reloadSections(section)
    }
}
