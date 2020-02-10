//
//  CharactersError.swift
//  MarvelNetwork
//
//  Created by Marco Domingues on 10/02/2020.
//  Copyright © 2020 Marco. All rights reserved.
//

import Foundation

internal enum CharactersError: Error {
    case empty
    case jsonParse
    case missingResource
}
