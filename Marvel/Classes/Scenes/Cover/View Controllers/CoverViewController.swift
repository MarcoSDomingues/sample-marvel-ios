//
//  CoverViewController.swift
//  Marvel
//
//  Created by Marco Domingues on 01/02/2020.
//  Copyright © 2020 Marco. All rights reserved.
//

import UIKit

class CoverViewController: UIViewController {
    
    // MARK: - Properties
    
    lazy var imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    private let viewModel: CoverViewModel
    
    // MARK: - Initialization
    
    init(viewModel: CoverViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupImageView()
        setupNavigationBar()
        view.addSubview(imageView)
    }
    
    // MARK: - Layout
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        imageView.frame = view.bounds
    }
    
    // MARK: - UI
    
    private func setupNavigationBar() {
        addCloseButton()
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
    }
    
    private func setupImageView() {
        guard let coverURLString = viewModel.coverUrlString,
            let url = URL(string: coverURLString) else {
                return
        }
        
        imageView.loadImage(withURL: url)
    }
    
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
