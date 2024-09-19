//
//  AppViewController.swift
//  AppStore
//
//  Created by Zahra Alizada on 19.09.24.
//

import UIKit

class AppViewController: UIViewController {
    // MARK: - Properties
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
}

// MARK: - Helpers
extension AppViewController {
    private func style() {
        view.backgroundColor = .yellow
    }
    private func layout() {
        
    }
}
