//
//  ComicsListManager.swift
//  Marvel
//
//  Created by Marco Domingues on 04/02/2020.
//  Copyright © 2020 Marco. All rights reserved.
//

import UIKit

final class ComicsListManager: ListContentManager {
    
    // MARK: - Properties
    
    public var comics: [ComicViewModel] {
        get {
            comicsSection.comics
        } set {
            comicsSection.comics = newValue
        }
    }
    
    private var comicsSection: ComicsSectionManager
    
    // MARK: - Initialization
    
    init(columns: Int) {
        comicsSection = ComicsSectionManager(columns: columns)
        
        super.init()
        
        sections = [comicsSection]
    }
    
}
