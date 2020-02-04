//
//  CharacterResponseModel.swift
//  MarvelNetwork
//
//  Created by Marco Domingues on 04/02/2020.
//  Copyright © 2020 Marco. All rights reserved.
//

import Foundation

internal struct CharacterResponseModel: Codable {
    
    internal let numberOfCharacters: Int?
    internal let characters: [CharacterRequestModel]?
    
    enum CodingKeys: String, CodingKey {
        case characters = "items"
        case numberOfCharacters = "available"
    }
}
