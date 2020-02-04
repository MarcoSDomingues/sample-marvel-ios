//
//  CharacterRequestModel.swift
//  MarvelNetwork
//
//  Created by Marco Domingues on 04/02/2020.
//  Copyright © 2020 Marco. All rights reserved.
//

import Foundation

internal struct CharacterRequestModel: Codable {
    
    internal let name: String?
    internal let resource: String?
    
    enum CodingKeys: String, CodingKey {
        case name
        case resource = "resourceURI"
    }
    
}
