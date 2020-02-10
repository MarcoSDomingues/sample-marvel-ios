//
//  Character.swift
//  MarvelDomain
//
//  Created by Marco Domingues on 10/02/2020.
//  Copyright © 2020 Marco. All rights reserved.
//

import Foundation

public struct Character {
    
    public let name: String?
    public let thumbnail: Thumbnail?
    
    public init(name: String?, thumbnail: Thumbnail?) {
        self.name = name
        self.thumbnail = thumbnail
    }
    
}
