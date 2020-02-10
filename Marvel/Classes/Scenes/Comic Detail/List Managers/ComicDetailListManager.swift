//
//  ComicDetailListManager.swift
//  Marvel
//
//  Created by Marco Domingues on 09/02/2020.
//  Copyright © 2020 Marco. All rights reserved.
//

import UIKit

protocol ComicDetailListManagerDelegate: class {
    func didSelectCover(_ comic: ComicViewModel)
}

final class ComicDetailListManager: ListContentManager {
    
    // MARK: - Properties
    
    weak var delegate: ComicDetailListManagerDelegate?
    
    public var comic: ComicViewModel {
        get {
            coverSection.comic
        } set {
            coverSection.comic = newValue
            titleSection.comic = newValue
            descriptionSection.comic = newValue
        }
    }
    
    private var coverSection: ComicCoverSectionManager
    private var titleSection: ComicTitleSectionManager
    private var descriptionSection: ComicDescriptionSectionManager
    
    // MARK: - Initialization
    
    init(comic: ComicViewModel, delegate: ComicDetailListManagerDelegate? = nil) {
        self.delegate = delegate
        coverSection = ComicCoverSectionManager(comic: comic)
        titleSection = ComicTitleSectionManager(comic: comic)
        descriptionSection = ComicDescriptionSectionManager(comic: comic)
        
        super.init()
        
        sections = [coverSection, titleSection, descriptionSection]
        
        coverSection.onSelectionActionBlock = { [weak self] in
            self?.delegate?.didSelectCover($0)
        }
    }
    
}
