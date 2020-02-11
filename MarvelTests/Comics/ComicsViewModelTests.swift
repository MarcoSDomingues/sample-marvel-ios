//
//  ComicsViewModelTests.swift
//  MarvelTests
//
//  Created by Marco Domingues on 11/02/2020.
//  Copyright © 2020 Marco. All rights reserved.
//

import XCTest
import RxTest
import RxSwift
import RxBlocking
@testable import Marvel
@testable import MarvelDomain
@testable import MarvelNetwork

class ComicsViewModelTests: XCTestCase {
    
    private var viewModel: ComicsViewModel!
    private var repository: ComicsMockRepository!
    
    private var disposeBag: DisposeBag!
    private var scheduler: TestScheduler!
    
    override func setUp() {
        super.setUp()
        repository = ComicsMockRepository()
        let useCase = ComicsUseCase(repository: repository)
        viewModel = ComicsViewModel(useCase: useCase, numberOfColumns: 3)
        
        disposeBag = DisposeBag()
        scheduler = TestScheduler(initialClock: 0)
    }
    
    func test_comics_success() {
        let comics = scheduler.createObserver([ComicViewModel].self)
        
        viewModel.comics
            .drive(comics)
            .disposed(by: disposeBag)
        
        scheduler.createColdObservable([
            .next(0, 20)
            ])
            .bind(to: viewModel.offset)
            .disposed(by: disposeBag)

        XCTAssertEqual(comics.events, [
            .next(0, successComics()),
        ])
    }
    
    func test_comics_error() {
        let errorDescription = scheduler.createObserver(String.self)
        
        repository.mode = .failure
        
        viewModel.errors
            .map { String(describing: $0) }
            .drive(errorDescription)
            .disposed(by: disposeBag)
        
        viewModel.comics
            .drive()
            .disposed(by: disposeBag)
        
        scheduler.createColdObservable([
            .next(0, 20)
            ])
            .bind(to: viewModel.offset)
            .disposed(by: disposeBag)
        
        XCTAssertEqual(errorDescription.events, [
            .next(0, String(describing: ComicsError.jsonParse)),
        ])
    }
    
    func test_is_loading() {
        let isLoading = scheduler.createObserver(Bool.self)
        
        viewModel.comics
            .drive()
            .disposed(by: disposeBag)
        
        viewModel.isLoading
            .drive(isLoading)
            .disposed(by: disposeBag)
        
        scheduler.createColdObservable([
            .next(10, 20),
            .next(20, 40)
            ])
            .bind(to: viewModel.offset)
            .disposed(by: disposeBag)
        
        scheduler.start()
        
        XCTAssertEqual(isLoading.events, [
            .next(0, false),
            .next(10, true),
            .next(10, false),
            .next(20, true),
            .next(20, false)
        ])
    }
    
    private func successComics() -> [ComicViewModel] {
        guard let data = repository.jsonData(),
            let jsonData = try? JSONSerialization.jsonObject(with: data),
            let json = try? JSONSerialization.data(withJSONObject: jsonData),
            let object = try? JSONDecoder().decode(ComicsResponseModel.self, from: json) else {
                return []
        }
        
        let comics = object.data.comics?.asComicArray() ?? []
        return comics.map { ComicViewModel(comic: $0) }
    }
    
}

extension ComicViewModel: Equatable {
    
    public static func == (lhs: ComicViewModel, rhs: ComicViewModel) -> Bool {
        return lhs.id == rhs.id && lhs.title == rhs.title
    }
    
}
