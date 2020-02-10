//
//  ComicDetailViewModel.swift
//  Marvel
//
//  Created by Marco Domingues on 01/02/2020.
//  Copyright © 2020 Marco. All rights reserved.
//

import Foundation

struct ComicDetailViewModel {
    
    // MARK: - Properties
    
    let comic: ComicViewModel
    
    // MARK: - Ininitialization
    
    init(comic: ComicViewModel) {
        self.comic = comic
    }
    
}
