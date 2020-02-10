//
//  CharactersUseCaseType.swift
//  MarvelDomain
//
//  Created by Marco Domingues on 10/02/2020.
//  Copyright © 2020 Marco. All rights reserved.
//

import RxSwift
import Foundation

public protocol CharactersUseCaseType {
    func getCharacters(with requests: [CharacterRequest]) -> Single<[Character]>
}
