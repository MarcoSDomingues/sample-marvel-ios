//
//  Thumbnail.swift
//  MarvelDomain
//
//  Created by Marco Domingues on 01/02/2020.
//  Copyright © 2020 Marco. All rights reserved.
//

import Foundation

public struct Thumbnail {
    
    public let path: String
    public let ext: String
    
    public init(path: String, ext: String) {
        self.path = path
        self.ext = ext
    }
    
}
