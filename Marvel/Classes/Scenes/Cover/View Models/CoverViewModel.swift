//
//  CoverViewModel.swift
//  Marvel
//
//  Created by Marco Domingues on 01/02/2020.
//  Copyright © 2020 Marco. All rights reserved.
//

import Foundation

struct CoverViewModel {
    
    // MARK: - Properties
    
    let coverUrlString: String?
    
    // MARK: - Ininitialization
    
    init(comic: ComicViewModel) {
        self.coverUrlString = comic.coverURLString
    }
    
}
