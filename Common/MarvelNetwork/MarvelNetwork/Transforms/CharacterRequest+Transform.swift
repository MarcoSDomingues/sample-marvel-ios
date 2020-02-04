//
//  CharacterRequest+Transform.swift
//  MarvelNetwork
//
//  Created by Marco Domingues on 04/02/2020.
//  Copyright © 2020 Marco. All rights reserved.
//

import MarvelDomain

internal extension CharacterRequestModel {
    
    func asCharacterRequest() -> CharacterRequest {
        return CharacterRequest(name: self.name, resource: self.resource)
    }
    
}

internal extension Sequence where Element == CharacterRequestModel {
    
    func asCharacterRequestArray() -> [CharacterRequest] {
        return self.map { $0.asCharacterRequest() }
    }
    
}

internal extension CharacterResponseModel {
    
    func asCharacterRequestArray() -> [CharacterRequest] {
        return self.characters?.asCharacterRequestArray() ?? []
    }
    
}
