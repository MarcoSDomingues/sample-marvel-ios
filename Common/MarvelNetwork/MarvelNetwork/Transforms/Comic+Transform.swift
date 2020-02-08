//
//  Comic+Transform.swift
//  MarvelNetwork
//
//  Created by Marco Domingues on 04/02/2020.
//  Copyright © 2020 Marco. All rights reserved.
//

import MarvelDomain

internal extension ComicModel {
    
    func asComic() -> Comic {
        return Comic(id: self.id,
                     title: self.title,
                     description: self.description,
                     pageCount: self.pageCount,
                     price: self.prices?.first?.price,
                     thumbnail: self.thumbnail?.asThumbnail(),
                     characters: self.characterData?.asCharacterRequestArray() ?? [])
    }
    
}

internal extension Sequence where Element == ComicModel {
    
    func asComicArray() -> [Comic] {
        return self.map { $0.asComic() }
    }
    
}
