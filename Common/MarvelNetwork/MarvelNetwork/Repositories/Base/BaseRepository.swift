//
//  BaseRepository.swift
//  MarvelNetwork
//
//  Created by Marco Domingues on 10/02/2020.
//  Copyright © 2020 Marco. All rights reserved.
//

import Foundation

public class BaseRepository {
    
    internal let host: String
    internal let publicKey: String
    internal let privateKey: String
    
    internal var path: String {
        return ""
    }
    
    internal var components: URLComponents {
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
    
    internal var request: URLRequest {
        var components = self.components
        components.path = path
        return URLRequest(url: components.url!)
    }
    
    public init() {
        let bundle = Bundle(for: type(of: self))
        let plistPath = bundle.path(forResource: "Config", ofType: "plist")!
        let plistData = FileManager.default.contents(atPath: plistPath)!
        
        let keyData = try! PropertyListSerialization.propertyList(from: plistData, options: .mutableContainersAndLeaves, format: nil) as! Dictionary<String, Any>
        
        self.host = keyData["host"] as! String
        self.publicKey = keyData["publicKey"] as! String
        self.privateKey = keyData["privateKey"] as! String
    }
    
}
