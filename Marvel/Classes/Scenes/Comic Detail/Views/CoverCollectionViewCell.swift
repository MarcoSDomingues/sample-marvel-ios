//
//  CoverCollectionViewCell.swift
//  Marvel
//
//  Created by Marco Domingues on 09/02/2020.
//  Copyright © 2020 Marco. All rights reserved.
//

import UIKit

class CoverCollectionViewCell: UICollectionViewCell {
    
    enum Constants {
        static let margin: CGFloat = 60.0
        static let aspectRatio: CGFloat = 3/4
    }
    
    // MARK: - Properties
    
    var item: ComicViewModel? {
        didSet {
            if let viewModel = item {
                bindViewModel(viewModel)
            }
        }
    }
    
    lazy var imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    lazy var blurView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .light)
        return UIVisualEffectView(effect: blurEffect)
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
        addSubview(blurView)
        addSubview(imageView)
        backgroundColor = UIColor.white.withAlphaComponent(0.8)
    }
    
    // MARK: - Layout
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        blurView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            blurView.topAnchor.constraint(equalTo: topAnchor),
            blurView.bottomAnchor.constraint(equalTo: bottomAnchor),
            blurView.leadingAnchor.constraint(equalTo: leadingAnchor),
            blurView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        
        let margin = Constants.margin
        let aspectRatio = Constants.aspectRatio
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: margin),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -margin),
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor, multiplier: aspectRatio)
        ])
    }
    
    // MARK: - Bindings
    
    private func bindViewModel(_ viewModel: ComicViewModel) {
        guard let coverURLString = viewModel.coverURLString,
            let url = URL(string: coverURLString) else {
                return
        }
        
        imageView.loadImage(withURL: url)
    }
    
}
