//
//  ComicsViewController.swift
//  Marvel
//
//  Created by Marco Domingues on 01/02/2020.
//  Copyright © 2020 Marco. All rights reserved.
//

import UIKit
import RxSwift

class ComicsViewController: UIViewController {
    
    // MARK: - Properties
    
    let viewModel: ComicsViewModel = ComicsViewModel()
    lazy var disposeBag = DisposeBag()
    
    // MARK: - View Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 0.370555222, green: 0.3705646992, blue: 0.3705595732, alpha: 1)
        
        viewModel.comics
            .drive(onNext: { comics in
                print(comics)
            })
            .disposed(by: disposeBag)
    }
    
}
