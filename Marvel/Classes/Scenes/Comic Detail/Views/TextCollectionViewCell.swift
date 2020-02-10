//
//  TextCollectionViewCell.swift
//  Marvel
//
//  Created by Marco Domingues on 09/02/2020.
//  Copyright © 2020 Marco. All rights reserved.
//

import UIKit

class TextCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    var item: TextViewModel? {
        didSet {
            if let viewModel = item {
                bindViewModel(viewModel)
            }
        }
    }
    
    lazy var label: UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 0
        lbl.textColor = UIColor.white
        lbl.font = .systemFont(ofSize: 14)
        return lbl
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
        addSubview(label)
    }
    
    // MARK: - Layout
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = bounds
    }
    
    // MARK: - Bindings
    
    private func bindViewModel(_ viewModel: TextViewModel) {
        guard let attributes = viewModel.attributes, let text = viewModel.text else {
            label.text = viewModel.text
            return
        }
        
        label.attributedText = NSAttributedString(string: text, attributes: attributes)
    }
    
    // MARK: - Helpers
    
    open class func textHeight(_ text: String?, width: CGFloat, insets: UIEdgeInsets? = nil, attributes: [NSAttributedString.Key: Any]? = nil) -> CGFloat {
        guard let text = text else {
            return 0.0
        }
        
        let defaultAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 14),
        ]
        
        let attributes = attributes ?? defaultAttributes
        
        let constrainedWith = width - (insets?.left ?? 0) - (insets?.right ?? 0)
        let constrainedSize = CGSize(width: constrainedWith, height: CGFloat.greatestFiniteMagnitude)
        let options: NSStringDrawingOptions = [.usesFontLeading, .usesLineFragmentOrigin]
        let bounds = (text as NSString).boundingRect(with: constrainedSize, options: options, attributes: attributes, context: nil)
        
        return ceil(bounds.height)
    }
    
}
