//
//  ComicsDataModel.swift
//  MarvelNetwork
//
//  Created by Marco Domingues on 04/02/2020.
//  Copyright © 2020 Marco. All rights reserved.
//

import Foundation

internal struct ComicsDataModel: Codable {
    
    internal let offset: Int?
    internal let limit: Int?
    internal let total: Int?
    internal let count: Int?
    internal let comics: [ComicModel]?
    
    enum CodingKeys: String, CodingKey {
        case offset
        case limit
        case total
        case count
        case comics = "results"
    }
    
}
