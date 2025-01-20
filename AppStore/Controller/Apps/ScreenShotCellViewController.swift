//
//  ScreenShotCellViewController.swift
//  AppStore
//
//  Created by Zahra Alizada on 19.01.25.
//

import UIKit
private let reuseIdentifier = "ScreenshotCellIdentifier"
class ScreenShotCellViewController: UICollectionViewController {
    // MARK: - Properties
    var resultsImage: [String] = []{
        didSet{ collectionView.reloadData()}
    }
    // MARK: - Lifecycle
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(collectionViewLayout: layout)
        style()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Helpers
extension ScreenShotCellViewController{
    private func style(){
        collectionView.backgroundColor = .systemBackground
        collectionView.register(ScreenshotDetailCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }
}

// MARK: - UICollectionViewDataSource
extension ScreenShotCellViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.resultsImage.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ScreenshotDetailCell
        cell.resultImageString = self.resultsImage[indexPath.row]
        return cell
    }
}

extension ScreenShotCellViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width / 1.5, height: view.frame.height - 10)
    }
}
