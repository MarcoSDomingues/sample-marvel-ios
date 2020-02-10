//
//  ComicDetailViewController.swift
//  Marvel
//
//  Created by Marco Domingues on 01/02/2020.
//  Copyright © 2020 Marco. All rights reserved.
//

import UIKit
import RxSwift

class ComicDetailViewController: UIViewController {
    
    // MARK: - Properties
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = #colorLiteral(red: 0.2605174184, green: 0.2605243921, blue: 0.260520637, alpha: 1)
        cv.contentInsetAdjustmentBehavior = .never
        return cv
    }()
    
    lazy var disposeBag = DisposeBag()
    
    private let viewModel: ComicDetailViewModel
    private var contentManager: ComicDetailListManager
    
    // MARK: - Initialization
    
    init(viewModel: ComicDetailViewModel) {
        self.viewModel = viewModel
        self.contentManager = ComicDetailListManager(comic: viewModel.comic)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contentManager.delegate = self
        contentManager.managedCollectionView = collectionView
        
        addCloseButton()
        view.addSubview(collectionView)
    }
    
    // MARK: - Layout
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = view.bounds
    }
    
    // MARK: - UI
    
    private func addCloseButton() {
        if #available(iOS 13.0, *) {
            navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close,
                                                                target: self, action: #selector(onCloseAction))
        } else {
            navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Close", style: .plain,
                                                                target: self, action: #selector(onCloseAction))
        }
    }
    
    // MARK: - Actions
    
    @objc private func onCloseAction() {
        dismiss(animated: true)
    }
    
}

extension ComicDetailViewController: ComicDetailListManagerDelegate {
    
    func didSelectCover(_ comic: ComicViewModel) {
        let viewModel = CoverViewModel(comic: comic)
        let vc = CoverViewController(viewModel: viewModel)
        let navVc = UINavigationController(rootViewController: vc)
        navVc.modalPresentationStyle = .fullScreen
        present(navVc, animated: true)
    }
    
}
