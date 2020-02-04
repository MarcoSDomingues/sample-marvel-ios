//
//  ComicsRepository.swift
//  MarvelNetwork
//
//  Created by Marco Domingues on 02/02/2020.
//  Copyright © 2020 Marco. All rights reserved.
//

import Foundation
import MarvelDomain

final public class ComicsRepository: ComicsRepositoryType {
    
    private let host: String
    private let publicKey: String
    private let privateKey: String
    
    private var path: String {
        return "/v1/public/comics"
    }
    
    private var components: URLComponents {
        var components = URLComponents(string: host)!
        let ts = Int(Date().timeIntervalSince1970).description
        let hash = String(format: "%@%@%@", ts, privateKey, publicKey).md5
        components.queryItems = [
            URLQueryItem(name: "ts", value: ts),
            URLQueryItem(name: "hash", value: hash),
            URLQueryItem(name: "apikey", value: publicKey)
        ]
        return components
    }
    
    private var request: URLRequest {
        var components = self.components
        components.path = path
        return URLRequest(url: components.url!)
    }
    
    public init() {
        self.host = "https://gateway.marvel.com"
        self.publicKey = "e71939ba2d93c78047908a73192b57c9"
        self.privateKey = "fbfe5951a86b6fad3577bdfdb302738f4ae2e3bc"
    }
    
    // MARK: - ComicsRepositoryType
    
    public func getComics(with offset: Int, completionBlock: @escaping (Result<[Comic], Error>) -> Void) {
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            if let error = error {
                completionBlock(.failure(error))
                return
            }
            
            guard let data = data,
                let jsonData = try? JSONSerialization.jsonObject(with: data),
                let json = try? JSONSerialization.data(withJSONObject: jsonData),
                let object = try? JSONDecoder().decode(ComicsResponseModel.self, from: json) else {
                    completionBlock(.failure(MarvelError.comics))
                    return
            }
            
            let comics = object.data.comics?.asComicArray() ?? []
            completionBlock(.success(comics))
            
        }.resume()
    }

}

enum MarvelError: Error {
    case comics
}
