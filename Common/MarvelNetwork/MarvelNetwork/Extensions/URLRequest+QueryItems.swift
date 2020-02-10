//
//  URLRequest+QueryItems.swift
//  MarvelNetwork
//
//  Created by Marco Domingues on 08/02/2020.
//  Copyright © 2020 Marco. All rights reserved.
//

import Foundation

internal extension URLRequest {
    
    var components: URLComponents? {
        guard let url = self.url,
            let components = URLComponents(string: url.absoluteString) else {
                return nil
        }
        return components
    }
    
    var queryItems: [URLQueryItem] {
        return components?.queryItems ?? []
    }
    
    func adding(queryItems: [URLQueryItem]) -> URLRequest {
        guard var components = self.components else {
            return self
        }
        
        let original = self.queryItems
        components.queryItems = original + queryItems
        
        if let url = components.url {
            return URLRequest(url: url)
        }
        
        return self
    }
    
}
