//
//  ComicsUseCaseType.swift
//  MarvelDomain
//
//  Created by Marco Domingues on 01/02/2020.
//  Copyright © 2020 Marco. All rights reserved.
//

import RxSwift
import Foundation

public protocol ComicsUseCaseType {
    func getComics(with offset: Int) -> Single<[Comic]>
}
