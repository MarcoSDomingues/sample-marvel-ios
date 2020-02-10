//
//  TextViewModel.swift
//  Marvel
//
//  Created by Marco Domingues on 09/02/2020.
//  Copyright © 2020 Marco. All rights reserved.
//

import Foundation

struct TextViewModel {
    
    let text: String?
    let attributes: [NSAttributedString.Key: Any]?
    
    init(text: String?, attributes: [NSAttributedString.Key: Any]? = nil) {
        self.text = text
        self.attributes = attributes
    }
    
}
