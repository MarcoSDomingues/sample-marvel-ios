//
//  ComicsUseCase.swift
//  Marvel
//
//  Created by Marco Domingues on 01/02/2020.
//  Copyright © 2020 Marco. All rights reserved.
//

import RxSwift
import MarvelDomain
import MarvelNetwork

final class ComicsUseCase: ComicsUseCaseType {
    
    let repository: ComicsRepositoryType
    
    init(repository: ComicsRepositoryType = ComicsRepository()) {
        self.repository = repository
    }
    
    // MARK: - ComicsUseCaseType
    
    func getComics(with offset: Int) -> Single<[Comic]> {
        return Single.create { [weak self] single in
            
            self?.repository.getComics(with: offset) { result in
                
                switch result {
                case .success(let results):
                    single(.success(results))
                    
                case .failure(let error):
                    single(.error(error))
                }
                
            }
            
            return Disposables.create()
        }
    }

}
