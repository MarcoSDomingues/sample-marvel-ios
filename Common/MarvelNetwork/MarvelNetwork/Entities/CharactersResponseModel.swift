//
//  CharactersResponseModel.swift
//  MarvelNetwork
//
//  Created by Marco Domingues on 10/02/2020.
//  Copyright © 2020 Marco. All rights reserved.
//

import Foundation

internal struct CharactersResponseModel: Codable {
    internal let data: CharactersResultsModel
}

internal struct CharactersResultsModel: Codable {
    internal let results: [CharacterModel]?
}
