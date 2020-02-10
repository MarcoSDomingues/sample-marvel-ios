//
//  CharacterViewModel.swift
//  Marvel
//
//  Created by Marco Domingues on 10/02/2020.
//  Copyright © 2020 Marco. All rights reserved.
//

import Foundation
import MarvelDomain

struct CharacterViewModel {
    
    let thumbnailURLString: String?
    
    init(character: Character) {
        if let thumbnail = character.thumbnail, let path = thumbnail.path, let ext = thumbnail.ext {
            self.thumbnailURLString = NSString(string: path).appendingPathExtension(ext)
        } else {
            self.thumbnailURLString = nil
        }
    }
    
}
