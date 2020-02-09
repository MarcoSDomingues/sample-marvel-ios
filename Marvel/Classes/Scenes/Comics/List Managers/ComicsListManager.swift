//
//  ComicsListManager.swift
//  Marvel
//
//  Created by Marco Domingues on 04/02/2020.
//  Copyright © 2020 Marco. All rights reserved.
//

import UIKit

protocol ComicsListManagerDelegate: class {
    func didSelectComic(_ comic: ComicViewModel)
}

final class ComicsListManager: ListContentManager {
    
    // MARK: - Properties
    
    weak var delegate: ComicsListManagerDelegate?
    
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
    
    init(columns: Int, delegate: ComicsListManagerDelegate? = nil) {
        self.delegate = delegate
        loadingSection = LoadingSectionManager()
        comicsSection = ComicsSectionManager(columns: columns)
        
        super.init()
        
        sections = [comicsSection, loadingSection]
        
        comicsSection.onSelectionActionBlock = { [weak self] in
            self?.delegate?.didSelectComic($0)
        }
    }
    
}
