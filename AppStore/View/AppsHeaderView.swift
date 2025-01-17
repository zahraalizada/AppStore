//
//  AppsHeaderView.swift
//  AppStore
//
//  Created by Zahra Alizada on 14.01.25.
//

import UIKit

class AppsHeaderView: UICollectionReusableView {
    // MARK: - Properties
    private let  appsHeaderViewController = AppsHeaderViewController()
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .red
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Helpers
extension AppsHeaderView {
    private func style() {
        appsHeaderViewController.view.translatesAutoresizingMaskIntoConstraints = false
    }
    private func layout() {
        addSubview(appsHeaderViewController.view)
        NSLayoutConstraint.activate([
            appsHeaderViewController.view.topAnchor.constraint(equalTo: topAnchor),
            appsHeaderViewController.view.leadingAnchor.constraint(equalTo: leadingAnchor),
            appsHeaderViewController.view.trailingAnchor.constraint(equalTo: trailingAnchor),
            appsHeaderViewController.view.bottomAnchor.constraint(equalTo: bottomAnchor),
            ])
    
    }
}
