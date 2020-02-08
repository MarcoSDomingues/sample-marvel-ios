//
//  UIImageView+Nuke.swift
//  Marvel
//
//  Created by Marco Domingues on 08/02/2020.
//  Copyright © 2020 Marco. All rights reserved.
//

import Nuke

extension UIImageView {
    
    open func loadImage(withURL url: URL, placeholderImage: UIImage? = nil) {
        let request = ImageViewLoader.shared.makeRequest(with: url)
        var options = ImageLoadingOptions(transition: .fadeIn(duration: 0.25))
        options.pipeline = ImageViewLoader.shared.pipeline
        options.placeholder = placeholderImage
        Nuke.loadImage(with: request, options: options, into: self)
    }
    
}
