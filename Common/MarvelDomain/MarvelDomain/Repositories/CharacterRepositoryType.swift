//
//  CharacterRepositoryType.swift
//  MarvelDomain
//
//  Created by Marco Domingues on 10/02/2020.
//  Copyright © 2020 Marco. All rights reserved.
//

import Foundation

public protocol CharacterRepositoryType {
    func getCharacter(with request: CharacterRequest, completionBlock: @escaping (Result<Character, Error>) -> Void)
}
