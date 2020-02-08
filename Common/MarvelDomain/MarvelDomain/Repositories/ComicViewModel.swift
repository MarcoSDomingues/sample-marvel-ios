//
//  ComicViewModel.swift
//  Marvel
//
//  Created by Marco Domingues on 01/02/2020.
//  Copyright © 2020 Marco. All rights reserved.
//

import Foundation
import MarvelDomain

struct ComicViewModel {
    
    let id: Int?
    let title: String?
    let description: String?
    
    let price: Double?
    let pageCount: Int?
    let coverURLString: String?
    
    init(comic: Comic) {
        self.id = comic.id
        self.title = comic.title
        self.description = comic.description
        self.pageCount = comic.pageCount
        self.price = comic.price
        
        if let thumbnail = comic.thumbnail, let path = thumbnail.path, let ext = thumbnail.ext {
            self.coverURLString = NSString(string: path).appendingPathExtension(ext)
        } else {
            self.coverURLString = nil
        }
    }
    
}
