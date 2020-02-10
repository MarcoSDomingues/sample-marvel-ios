//
//  CharactersUseCase.swift
//  Marvel
//
//  Created by Marco Domingues on 10/02/2020.
//  Copyright © 2020 Marco. All rights reserved.
//

import RxSwift
import MarvelDomain
import MarvelNetwork

final class CharactersUseCase: CharactersUseCaseType {

    let repository: CharacterRepositoryType
    
    init(repository: CharacterRepositoryType = CharacterRepository()) {
        self.repository = repository
    }
    
    // MARK: - CharactersUseCaseType
    
    func getCharacters(with requests: [CharacterRequest]) -> Single<[Character]> {
        return Single.create { [weak self] single in
            
            let group = DispatchGroup()
            
            var characters: [Character] = []
            var error: Error? = nil
            
            requests.forEach {
                
                group.enter()
                self?.repository.getCharacter(with: $0) { result in
                    switch result {
                    case .success(let character):
                        characters.append(character)

                    case .failure(let characterError):
                        error = characterError
                    }
                    
                    group.leave()
                }
            }
            
            group.notify(queue: .main) {
                if let error = error {
                    single(.error(error))
                } else {
                    single(.success(characters))
                }
            }

            return Disposables.create()
        }
    }

}
