//
//  ListContentManager.swift
//  Marvel
//
//  Created by Marco Domingues on 04/02/2020.
//  Copyright © 2020 Marco. All rights reserved.
//

import UIKit

class ListContentManager: NSObject {
    
    // MARK: - Properties
    
    weak var managedCollectionView: UICollectionView! {
        didSet {
            managedCollectionView.delegate = self
            managedCollectionView.dataSource = self
            managedCollectionView.reloadData()
            
            configureContexts()
        }
    }
    
    var sections: [ListSectionManager] = [] {
        didSet {
            configureContexts()
        }
    }
    
    // MARK: - Configuration
    
    open func configureContexts() {
        sections.enumerated().forEach {
            if let collectionView = managedCollectionView {
                $0.element.registerReuseIdentifiers(in: collectionView)
            }
            
            $0.element.contentContext = ListContentContext(self, sectionIndex: $0.offset)
        }
    }
    
}

extension ListContentManager: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard collectionView == managedCollectionView else {
            fatalError("UICollectionView not managed by \(self)")
        }
        return sections[indexPath.section].sizeForItemAt(indexPath.item)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        guard collectionView == managedCollectionView else {
            fatalError("UICollectionView not managed by \(self)")
        }
        return sections[section].sectionInset()
    }
    
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        guard collectionView == managedCollectionView else {
            fatalError("UICollectionView not managed by \(self)")
        }
        return sections[indexPath.section].shouldSelectItemAt(indexPath.item)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard collectionView == managedCollectionView else {
            fatalError("UICollectionView not managed by \(self)")
        }
        sections[indexPath.section].didSelectItemAt(indexPath.item)
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        guard collectionView == managedCollectionView else {
            fatalError("UICollectionView not managed by \(self)")
        }
        sections[indexPath.section].didDeselectItemAt(indexPath.item)
    }
    
}

extension ListContentManager: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        guard collectionView == managedCollectionView else {
            fatalError("UICollectionView not managed by \(self)")
        }
        return sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard collectionView == managedCollectionView else {
            fatalError("UICollectionView not managed by \(self)")
        }
        return sections[section].numberOfItems()
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard collectionView == managedCollectionView else {
            fatalError("UICollectionView not managed by \(self)")
        }
        return sections[indexPath.section].cellForItemAt(indexPath.item)
    }
    
}
