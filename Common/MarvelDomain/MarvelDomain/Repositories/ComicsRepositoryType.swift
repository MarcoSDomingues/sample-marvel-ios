//
//  ComicsRepositoryType.swift
//  MarvelDomain
//
//  Created by Marco Domingues on 01/02/2020.
//  Copyright © 2020 Marco. All rights reserved.
//

import Foundation

public protocol ComicsRepositoryType {
    func getComics(with offset: Int, limit: Int, completionBlock: @escaping (Result<[Comic], Error>) -> Void)
}
