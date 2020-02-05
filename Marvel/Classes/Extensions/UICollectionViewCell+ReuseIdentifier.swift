//
//  UICollectionViewCell+ReuseIdentifier.swift
//  Marvel
//
//  Created by Marco Domingues on 04/02/2020.
//  Copyright © 2020 Marco. All rights reserved.
//

import UIKit

extension UICollectionViewCell {
    
    class var reuseIdentifier: String {
        return String(describing: self)
    }
    
    static func register(in collectionView: UICollectionView) {
        collectionView.register(self, forCellWithReuseIdentifier: reuseIdentifier)
    }

    static func dequeue(from collectionView: UICollectionView, for indexPath: IndexPath) -> Self {
        return collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier,
                                                  for: indexPath) as! Self
    }
    
}
