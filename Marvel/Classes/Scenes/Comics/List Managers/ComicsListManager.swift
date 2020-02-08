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
            isLoading = false
            comicsSection.comics = newValue
        }
    }
    
    public var isLoading: Bool {
        get {
            return loadingSection.isLoading
        } set {
            loadingSection.isLoading = newValue
        }
    }
    
    private var comicsSection: ComicsSectionManager
    private var loadingSection: LoadingSectionManager
    
    // MARK: - Initialization
    
    init(columns: Int) {
        comicsSection = ComicsSectionManager(columns: columns)
        loadingSection = LoadingSectionManager()
        
        super.init()
        
        sections = [comicsSection, loadingSection]
    }
    
}
