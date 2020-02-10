//
//  BaseNavigationController.swift
//  Marvel
//
//  Created by Marco Domingues on 01/02/2020.
//  Copyright © 2020 Marco. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController {
    
//    override open var preferredStatusBarStyle: UIStatusBarStyle {
//        return self.topViewController?.preferredStatusBarStyle ?? .lightContent
//    }
    
    // MARK: - View Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationBar.barTintColor = #colorLiteral(red: 0.4756349325, green: 0.4756467342, blue: 0.4756404161, alpha: 1)
        navigationBar.prefersLargeTitles = true
        
        navigationBar.titleTextAttributes = [
            .font: UIFont.boldSystemFont(ofSize: 16),
            .foregroundColor: UIColor.white
        ]
        
        navigationBar.largeTitleTextAttributes = [
            .font: UIFont.boldSystemFont(ofSize: 26),
            .foregroundColor: UIColor.white
        ]
    }
    
}
