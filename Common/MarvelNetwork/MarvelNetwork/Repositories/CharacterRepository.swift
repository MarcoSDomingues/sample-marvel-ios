//
//  CharacterRepository.swift
//  MarvelNetwork
//
//  Created by Marco Domingues on 10/02/2020.
//  Copyright © 2020 Marco. All rights reserved.
//

import Foundation
import MarvelDomain

final public class CharacterRepository: BaseRepository, CharacterRepositoryType {
    
    // MARK: - CharacterRepositoryType
    
    public func getCharacter(with request: CharacterRequest, completionBlock: @escaping (Result<Character, Error>) -> Void) {
        print("🍒 \(request.resource)")
    }
    
}
