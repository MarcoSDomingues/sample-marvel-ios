//
//  ComicDetailViewController.swift
//  Marvel
//
//  Created by Marco Domingues on 01/02/2020.
//  Copyright © 2020 Marco. All rights reserved.
//

import UIKit

class ComicDetailViewController: UIViewController {
    
    // MARK: - View Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        addCloseButton()
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
