//
//  ComicsViewController.swift
//  Marvel
//
//  Created by Marco Domingues on 01/02/2020.
//  Copyright © 2020 Marco. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ComicsViewController: UIViewController {
    
    // MARK: - Properties
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        return UICollectionView(frame: .zero, collectionViewLayout: layout)
    }()
    
    lazy var disposeBag = DisposeBag()
    
    private let viewModel: ComicsViewModel
    private var contentManager: ComicsListManager
    
    lazy var activityIndicatorView: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(style: .whiteLarge)
        view.color = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
        view.hidesWhenStopped = true
        return view
    }()
    
    // MARK: - Initialization
    
    init(viewModel: ComicsViewModel = ComicsViewModel()) {
        self.viewModel = viewModel
        self.contentManager = ComicsListManager(columns: viewModel.numberOfColumns)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(collectionView)
        view.addSubview(activityIndicatorView)
        
        contentManager.delegate = self
        contentManager.managedCollectionView = collectionView
        collectionView.backgroundColor = #colorLiteral(red: 0.2605174184, green: 0.2605243921, blue: 0.260520637, alpha: 1)
        
        setupBindings()
        title = "Comics"
    }
    
    // MARK: - Layout
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            activityIndicatorView.topAnchor.constraint(equalTo: view.topAnchor),
            activityIndicatorView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            activityIndicatorView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            activityIndicatorView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    // MARK: - Bindings
    
    private func setupBindings() {
        viewModel.comics
            .drive(onNext: { [weak self] comics in
                self?.contentManager.comics.append(contentsOf: comics)
                self?.activityIndicatorView.stopAnimating()
            })
            .disposed(by: disposeBag)
        
        viewModel.errors
            .drive(onNext: { [weak self] error in
                self?.showAlertForError(error)
            })
            .disposed(by: disposeBag)
        
        viewModel.isLoading
            .drive(onNext: { [weak self] isLoading in
                guard let contentManager = self?.contentManager else {
                    return
                }
                
                if contentManager.comics.isEmpty {
                    self?.activityIndicatorView.startAnimating()
                } else {
                    contentManager.isLoading = true
                }
            })
            .disposed(by: disposeBag)
        
        collectionView.rx.willEndDragging
            .filter({ [weak self] velocity, targetContentOffset in
                guard let collectionView = self?.collectionView else {
                    return false
                }
                
                let distance = collectionView.contentSize.height - (targetContentOffset.pointee.y + collectionView.bounds.height)
                return distance < 200
            })
            .map ({ [weak self] _ in self?.contentManager.comics.count })
            .filter ({ $0 != nil })
            .map { $0! }
            .bind(to: viewModel.offset)
            .disposed(by: disposeBag)
    }
    
    // MARK: -
    
    private func showAlertForError(_ error: Error) {
        let ac = UIAlertController(title: "Error",
                                   message: error.localizedDescription,
                                   preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Ok", style: .default)
        ac.addAction(okAction)
        
        present(ac, animated: true)
    }
    
}

extension ComicsViewController: ComicsListManagerDelegate {
    
    func didSelectComic(_ comic: ComicViewModel) {
        let viewModel = ComicDetailViewModel(comic: comic)
        let vc = ComicDetailViewController(viewModel: viewModel)
        let navVc = BaseNavigationController(rootViewController: vc)
        navVc.modalPresentationStyle = .fullScreen
        present(navVc, animated: true)
    }
    
}
