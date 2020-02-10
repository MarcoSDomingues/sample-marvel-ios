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
        
        guard let resource = request.resource, let url = URL(string: resource) else {
            completionBlock(.failure(CharactersError.missingResource))
            return
        }
        
        let queryItems = self.request.queryItems
        let request = URLRequest(url: url).adding(queryItems: queryItems)
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            if let error = error {
                completionBlock(.failure(error))
                return
            }
            
            if let data = data {
                print(data)
            }
            
        }.resume()
    }
    
}

enum CharactersError: Error {
    case missingResource
}
