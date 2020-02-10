//
//  Character+Transform.swift
//  MarvelNetwork
//
//  Created by Marco Domingues on 10/02/2020.
//  Copyright © 2020 Marco. All rights reserved.
//

import Foundation
import MarvelDomain

internal extension CharacterModel {
    
    func asCharacter() -> Character {
        return Character(thumbnail: self.thumbnail?.asThumbnail())
    }
    
}
