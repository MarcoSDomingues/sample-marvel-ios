//
//  CharacterRequest.swift
//  MarvelDomain
//
//  Created by Marco Domingues on 01/02/2020.
//  Copyright © 2020 Marco. All rights reserved.
//

import Foundation

public struct CharacterRequest {
    
    public let name: String
    public let resource: String
    
    public init(name: String, resource: String) {
        self.name = name
        self.resource = resource
    }
    
}
