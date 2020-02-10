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
    
    enum Constants {
        static let titleAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.white,
            .font: UIFont.boldSystemFont(ofSize: 26)
        ]
        static let descriptionAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.white,
            .font: UIFont.systemFont(ofSize: 14)
        ]
    }
    
    // MARK: - Properties
    
    weak var delegate: ComicDetailListManagerDelegate?
    
    public var comic: ComicViewModel {
        get {
            coverSection.comic
        } set {
            coverSection.comic = newValue
            titleSection.textModel = TextViewModel(text: comic.title,
                                                   attributes: Constants.descriptionAttributes)
            descriptionSection.textModel = TextViewModel(text: comic.description,
                                                         attributes: Constants.descriptionAttributes)

        }
    }
    
    public var characters: [CharacterViewModel] {
        get {
            return charactersSection.characters
        } set {
            charactersSection.characters = newValue
        }
    }
    
    public var isLoading: Bool {
        get {
            return loadingSection.isLoading
        } set {
            loadingSection.isLoading = newValue
        }
    }
    
    private var coverSection: ComicCoverSectionManager
    private var titleSection: TextSectionManager
    private var descriptionSection: TextSectionManager
    private var charactersSection: CharactersSectionManager
    private var loadingSection: LoadingSectionManager
    
    // MARK: - Initialization
    
    init(comic: ComicViewModel, delegate: ComicDetailListManagerDelegate? = nil) {
        self.delegate = delegate
        coverSection = ComicCoverSectionManager(comic: comic)
        loadingSection = LoadingSectionManager()
        charactersSection = CharactersSectionManager()
        
        let titleModel = TextViewModel(text: comic.title,
                                       attributes: Constants.titleAttributes)
        titleSection = TextSectionManager(textModel: titleModel)
        
        let descriptionModel = TextViewModel(text: comic.description,
                                             attributes: Constants.descriptionAttributes)
        descriptionSection = TextSectionManager(textModel: descriptionModel)
        
        super.init()
        
        sections = [coverSection, titleSection, descriptionSection, loadingSection, charactersSection]
        
        coverSection.onSelectionActionBlock = { [weak self] in
            self?.delegate?.didSelectCover($0)
        }
    }
    
}
