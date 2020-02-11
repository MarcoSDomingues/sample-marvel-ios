//
//  ComicsMockRepository.swift
//  MarvelTests
//
//  Created by Marco Domingues on 11/02/2020.
//  Copyright © 2020 Marco. All rights reserved.
//

import Foundation
@testable import MarvelDomain
@testable import MarvelNetwork

class ComicsMockRepository: ComicsRepositoryType {
   
    enum TestMode {
        case success
        case failure
    }
    
    var mode: TestMode = .success
    
    // MARK: - ComicsRepositoryType
    
    func getComics(with offset: Int, limit: Int, completionBlock: @escaping (Result<[Comic], Error>) -> Void) {
        guard let data = jsonData(),
            let jsonData = try? JSONSerialization.jsonObject(with: data),
            let json = try? JSONSerialization.data(withJSONObject: jsonData),
            let object = try? JSONDecoder().decode(ComicsResponseModel.self, from: json) else {
                completionBlock(.failure(ComicsError.jsonParse))
                return
        }
        
        let comics = object.data.comics?.asComicArray() ?? []
        completionBlock(.success(comics))
    }
    
    // MARK: - Helpers
    
    func jsonData() -> Data? {
        let bundle = Bundle(for: type(of: self))
        
        switch mode {
        case .success:
            guard let url = bundle.url(forResource: "comics-success", withExtension: "json") else {
                return nil
            }
            return try? Data(contentsOf: url)
        case .failure:
            guard let url = bundle.url(forResource: "comics-error", withExtension: "json") else {
                return nil
            }
            return try? Data(contentsOf: url)
        }
    }
    
}
