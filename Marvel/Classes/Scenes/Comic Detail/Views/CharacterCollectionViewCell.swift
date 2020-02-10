//
//  CharacterCollectionViewCell.swift
//  Marvel
//
//  Created by Marco Domingues on 10/02/2020.
//  Copyright © 2020 Marco. All rights reserved.
//

import UIKit

class CharacterCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    var item: CharacterViewModel? {
        didSet {
            if let viewModel = item {
                bindViewModel(viewModel)
            }
        }
    }
    
    // MARK: -
    
    lazy var stackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.spacing = 20.0
        sv.alignment = .center
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .white
        lbl.font = .systemFont(ofSize: 14)
        return lbl
    }()
    
    lazy var imageView: UIImageView = {
        let iv = UIImageView()
        iv.clipsToBounds = true
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    lazy var separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1)
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
        addSubview(stackView)
        addSubview(separatorView)
        
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(titleLabel)
    }
    
    // MARK: - Layout
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: separatorView.topAnchor)
        ])
        
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            separatorView.heightAnchor.constraint(equalToConstant: 1.0),
            separatorView.bottomAnchor.constraint(equalTo: bottomAnchor),
            separatorView.leadingAnchor.constraint(equalTo: leadingAnchor),
            separatorView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        
        let height = bounds.height * 0.75
        imageView.heightAnchor.constraint(equalToConstant: height).isActive = true
        imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor).isActive = true
        imageView.layer.cornerRadius = height / 2
        imageView.layer.borderWidth = 1.0
        imageView.layer.borderColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1).cgColor
    }
    
    // MARK: - Bindings
    
    private func bindViewModel(_ viewModel: CharacterViewModel) {
        titleLabel.text = viewModel.name
        
        guard let thumbnailUrlString = viewModel.thumbnailURLString,
            let url = URL(string: thumbnailUrlString) else {
                imageView.isHidden = true
                return
        }
        
        imageView.loadImage(withURL: url)
    }
    
}
