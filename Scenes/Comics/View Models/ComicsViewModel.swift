//
//  ComicsViewModel.swift
//  Marvel
//
//  Created by Marco Domingues on 01/02/2020.
//  Copyright © 2020 Marco. All rights reserved.
//

import RxSwift
import RxCocoa
import Foundation
import MarvelDomain

struct ComicsViewModel {
    
    // MARK: - Inputs
    
    let offset: AnyObserver<Int>
    
    // MARK: - Outputs
    
    let errors: Driver<Error>
    let isLoading: Driver<Bool>
    let comics: Driver<[ComicViewModel]>
    
    // MARK: - Ininitialization
    
    init(useCase: ComicsUseCaseType = ComicsUseCase()) {
        
        let errorTracker = ErrorTracker()
        self.errors = errorTracker.asDriver()
        
        let activityIndicator = ActivityIndicator()
        self.isLoading = activityIndicator.asDriver()
        
        let _offset = PublishSubject<Int>()
        self.offset = _offset.asObserver()
        
        self.comics = _offset.asObservable()
            .startWith(0)
            .flatMapLatest({ offset in
                useCase.getComics(with: offset)
                    .trackActivity(activityIndicator)
                    .trackError(errorTracker)
            })
            .map { $0.map { ComicViewModel(comic: $0) } }
            .asDriver(onErrorJustReturn: [])
    }
    
}
