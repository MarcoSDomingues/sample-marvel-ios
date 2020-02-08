//
//  LoadingIndicatorCollectionViewCell.swift
//  Marvel
//
//  Created by Marco Domingues on 08/02/2020.
//  Copyright © 2020 Marco. All rights reserved.
//

import UIKit

class LoadingIndicatorCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    // MARK: -
    
    lazy var activityIndicatorView: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView()
        view.color = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
        view.startAnimating()
        return view
    }()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        _init()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        _init()
    }
    
    private func _init() {
        addSubview(activityIndicatorView)
    }
    
    // MARK: - Layout
    
    override func layoutSubviews() {
        super.layoutSubviews()
        activityIndicatorView.frame = bounds
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        activityIndicatorView.startAnimating()
    }
    
}
