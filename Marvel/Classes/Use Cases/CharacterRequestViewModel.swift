//
//  CharacterRequestViewModel.swift
//  Marvel
//
//  Created by Marco Domingues on 10/02/2020.
//  Copyright © 2020 Marco. All rights reserved.
//

import Foundation
import MarvelDomain

struct CharacterRequestViewModel {
    
    let name: String?
    let resource: String?
    
    init(characterRequest: CharacterRequest) {
        self.name = characterRequest.name
        self.resource = characterRequest.resource
    }
    
}
