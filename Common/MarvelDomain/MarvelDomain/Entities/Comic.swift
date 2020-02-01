//
//  Comic.swift
//  MarvelDomain
//
//  Created by Marco Domingues on 01/02/2020.
//  Copyright © 2020 Marco. All rights reserved.
//

import Foundation

public struct Comic {
    
    public let id: Int?
    public let title: String?
    public let description: String?
    public let issueNumber: Double?
    
    public let pageCount: Int?
    public let price: Double?
    
    public let thumbnail: Thumbnail?
    public let characters: [CharacterRequest]
    
    public init(id: Int?, title: String?, description: String?, issueNumber: Double?, pageCount: Int?, price: Double?, thumbnail: Thumbnail?, characters: [CharacterRequest]) {
        self.id = id
        self.title = title
        self.description = description
        self.issueNumber = issueNumber
        self.pageCount = pageCount
        self.price = price
        self.thumbnail = thumbnail
        self.characters = characters
    }
    
}
