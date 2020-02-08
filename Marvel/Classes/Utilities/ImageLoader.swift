//
//  ImageLoader.swift
//  Marvel
//
//  Created by Marco Domingues on 08/02/2020.
//  Copyright © 2020 Marco. All rights reserved.
//

import Nuke

class ImageViewLoader {
    
    let pipeline: ImagePipeline
    static let shared = ImageViewLoader()

    private init() {
        pipeline = ImagePipeline {
            let config = URLSessionConfiguration.default
            $0.dataLoader = DataLoader(configuration: config)
            $0.dataCache = try? DataCache(name: "marvel.comics")
        }
    }
    
    func makeRequest(with url: URL) -> ImageRequest {
        return ImageRequest(url: url)
    }
    
}
