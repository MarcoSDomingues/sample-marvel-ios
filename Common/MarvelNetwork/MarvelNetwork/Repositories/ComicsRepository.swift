//
//  ComicsRepository.swift
//  MarvelNetwork
//
//  Created by Marco Domingues on 02/02/2020.
//  Copyright © 2020 Marco. All rights reserved.
//

import Foundation
import MarvelDomain

final public class ComicsRepository: BaseRepository, ComicsRepositoryType {

    override internal var path: String {
        return "/v1/public/comics"
    }
    
    // MARK: - ComicsRepositoryType
    
    public func getComics(with offset: Int, limit: Int, completionBlock: @escaping (Result<[Comic], Error>) -> Void) {
        
        let queryItems: [URLQueryItem] = [
            URLQueryItem(name: "limit", value: "\(limit)"),
            URLQueryItem(name: "offset", value: "\(offset)"),
            URLQueryItem(name: "orderBy", value: "-modified")
        ]
        
        let request = self.request.adding(queryItems: queryItems)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            if let error = error {
                completionBlock(.failure(error))
                return
            }
            
            guard let data = data,
                let jsonData = try? JSONSerialization.jsonObject(with: data),
                let json = try? JSONSerialization.data(withJSONObject: jsonData),
                let object = try? JSONDecoder().decode(ComicsResponseModel.self, from: json) else {
                    completionBlock(.failure(ComicsError.jsonParse))
                    return
            }
            
            let comics = object.data.comics?.asComicArray() ?? []
            completionBlock(.success(comics))
            
        }.resume()
    }

}
