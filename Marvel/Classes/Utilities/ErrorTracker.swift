//
//  ErrorTracker.swift
//  Marvel
//
//  Created by Marco Domingues on 04/02/2020.
//  Copyright © 2020 Marco. All rights reserved.
//

import RxSwift
import RxCocoa

public class ErrorTracker: SharedSequenceConvertibleType {
    public typealias Element = Error
    public typealias SharingStrategy = DriverSharingStrategy
    
    private let _lock = NSRecursiveLock()
    private let _relay = PublishSubject<Element>()
    private let _error: SharedSequence<SharingStrategy, Element>
    
    public init() {
        _error = _relay.asDriverOnErrorJustComplete()
    }
    
    fileprivate func trackErrorOfObservable<Source: ObservableConvertibleType>(_ source: Source) -> Observable<Source.Element> {
        return source
            .asObservable()
            .materialize()
            .do(onNext: {
                if let error = $0.event.error {
                    self.setError(error)
                }
            })
            .filter { $0.event.element != nil }
            .map { $0.event.element! }
    }
    
    private func setError(_ error: Error) {
        _lock.lock()
        _relay.onNext(error)
        _lock.unlock()
    }
    
    public func asSharedSequence() -> SharedSequence<SharingStrategy, Element> {
        return _error
    }
    
}

extension ObservableConvertibleType {
    
    public func trackError(_ errorTracker: ErrorTracker) -> Observable<Element> {
        return errorTracker.trackErrorOfObservable(self)
    }
    
}

extension ObservableType {
    
    func asDriverOnErrorJustComplete() -> Driver<Element> {
        return asDriver { error in
            return Driver.empty()
        }
    }
}

