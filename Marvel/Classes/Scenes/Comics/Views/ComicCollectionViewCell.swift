//
//  ComicCollectionViewCell.swift
//  Marvel
//
//  Created by Marco Domingues on 08/02/2020.
//  Copyright © 2020 Marco. All rights reserved.
//

import UIKit

class ComicCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    var item: ComicViewModel? {
        didSet {
            if let viewModel = item {
                bindViewModel(viewModel)
            }
        }
    }
    
    // MARK: -
    
    lazy var imageView: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = #colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1)
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
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
        addSubview(imageView)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }
    
    // MARK: - Layout
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = bounds
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
