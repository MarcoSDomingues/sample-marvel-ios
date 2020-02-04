//
//  ThumbnailMode.swift
//  MarvelNetwork
//
//  Created by Marco Domingues on 04/02/2020.
//  Copyright © 2020 Marco. All rights reserved.
//

import Foundation

internal struct ThumbnailModel: Codable {
    
    internal let path: String?
    internal let ext: String?
    
    enum CodingKeys: String, CodingKey {
        case path
        case ext = "extension"
    }
    
}
