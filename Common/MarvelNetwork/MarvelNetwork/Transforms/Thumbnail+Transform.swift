//
//  Thumbnail+Transform.swift
//  MarvelNetwork
//
//  Created by Marco Domingues on 04/02/2020.
//  Copyright © 2020 Marco. All rights reserved.
//

import MarvelDomain

internal extension ThumbnailModel {
    
    func asThumbnail() -> Thumbnail {
        return Thumbnail(path: self.path, ext: self.ext)
    }
    
}
