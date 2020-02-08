//
//  URLRequest+QueryItems.swift
//  MarvelNetwork
//
//  Created by Marco Domingues on 08/02/2020.
//  Copyright © 2020 Marco. All rights reserved.
//

import Foundation

internal extension URLRequest {
    
    func adding(queryItems: [URLQueryItem]) -> URLRequest {
        guard let url = self.url,
            var components = URLComponents(string: url.absoluteString) else {
                return self
        }
        
        let original = components.queryItems ?? []
        components.queryItems = original + queryItems
        
        if let url = components.url {
            return URLRequest(url: url)
        }
        
        return self
    }
    
}
