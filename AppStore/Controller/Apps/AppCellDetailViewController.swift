//
//  AppCellDetailViewController.swift
//  AppStore
//
//  Created by Zahra Alizada on 07.10.24.
//

import UIKit

private let reuseIdentifier = "AppCellDetailCell"

class AppCellDetailViewController: UICollectionViewController {
    // MARK: - Properties
    // MARK: - Lifecycle
    
    init() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        super.init(collectionViewLayout: flowLayout)
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Helpers
extension AppCellDetailViewController {
    private func style() {
        collectionView.register(AppCellDetailCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
    }
    private func layout() {
        
    }
}

extension AppCellDetailViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
        
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! AppCellDetailCell
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension AppCellDetailViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 30, height: (view.frame.height) / 3 - 3)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 3
    }
    
}
