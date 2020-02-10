//
//  ComicModel.swift
//  MarvelNetwork
//
//  Created by Marco Domingues on 04/02/2020.
//  Copyright © 2020 Marco. All rights reserved.
//

import Foundation

internal struct ComicModel: Codable {
    
    internal let id: Int?
    internal let title: String?
    internal let description: String?
    internal let pageCount: Int?
    
    internal let prices: [PriceModel]?
    
    internal let thumbnail: ThumbnailModel?
    internal let characterData: CharacterResponseModel?
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case description
        case pageCount
        case prices
        case thumbnail
        case characterData = "characters"
    }
    
}
