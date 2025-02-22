//
//  AppCell.swift
//  AppStore
//
//  Created by Zahra Alizada on 07.10.24.
//

import UIKit
protocol AppCellProtocol: AnyObject{
    func goAppInfoViewController(id: String)
}

class AppCell: UICollectionViewCell {
    // MARK: - Properties
    weak var delegate: AppCellProtocol?
    var feed:Feed?{
        didSet{ configure() }
    }
    private let sectionLabel: UILabel = {
        let label = UILabel()
        label.text = "Section Name"
        label.font = UIFont.boldSystemFont(ofSize: 25)
        return label
    }()
    
    private let appCellDetailViewController = AppCellDetailViewController()
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AppCell {
    private func style() {
        sectionLabel.translatesAutoresizingMaskIntoConstraints = false
        appCellDetailViewController.view.translatesAutoresizingMaskIntoConstraints = false
        appCellDetailViewController.delegate = self
    }
    private func layout() {
        addSubview(sectionLabel)
        addSubview(appCellDetailViewController.view)
        NSLayoutConstraint.activate([
            sectionLabel.topAnchor.constraint(equalTo: topAnchor),
            sectionLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            sectionLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            appCellDetailViewController.view.topAnchor.constraint(equalTo: sectionLabel.bottomAnchor,constant: 8),
            appCellDetailViewController.view.leadingAnchor.constraint(equalTo: leadingAnchor),
            appCellDetailViewController.view.trailingAnchor.constraint(equalTo: trailingAnchor),
            appCellDetailViewController.view.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func configure() {
        guard let feed = self.feed else { return }
        self.sectionLabel.text = feed.title
        self.appCellDetailViewController.results = feed.results
    }
}

// MARK: AppCellDetailViewControllerProtocol
extension AppCell: AppCellDetailViewControllerProtocol {
    func goAppInfoViewController(id: String) {
        delegate?.goAppInfoViewController(id: id)
    }
    
    
}
