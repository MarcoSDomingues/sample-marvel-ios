//
//  ComicDetailViewModel.swift
//  Marvel
//
//  Created by Marco Domingues on 01/02/2020.
//  Copyright © 2020 Marco. All rights reserved.
//

import RxSwift
import RxCocoa
import Foundation
import MarvelDomain

struct ComicDetailViewModel {
    
    // MARK: - Properties
    
    let comic: ComicViewModel
    
    // MARK: - Outputs
    
    let errors: Driver<Error>
    let isLoading: Driver<Bool>
    let characters: Driver<[CharacterViewModel]>
    
    // MARK: - Ininitialization
    
    init(comic: ComicViewModel, useCase: CharactersUseCaseType = CharactersUseCase()) {
        self.comic = comic
        
        let errorTracker = ErrorTracker()
        self.errors = errorTracker.asDriver()
        
        let activityIndicator = ActivityIndicator()
        self.isLoading = activityIndicator.asDriver()
        
        let _requests = PublishSubject<[CharacterRequest]>()
        
        let charactersRequests = comic.characterRequests.map {
            CharacterRequest(name: $0.name, resource: $0.resource)
        }
        
        self.characters = _requests.asObservable()
            .startWith(charactersRequests)
            .flatMapLatest({ requests in
                useCase.getCharacters(with: requests)
                    .trackActivity(activityIndicator)
                    .trackError(errorTracker)
            })
            .map { $0.map { CharacterViewModel(character: $0) } }
            .asDriverOnErrorJustComplete()
    }
    
}
