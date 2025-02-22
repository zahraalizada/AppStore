//
//  ScreenshotDetailCell.swift
//  AppStore
//
//  Created by Zahra Alizada on 19.01.25.
//

import UIKit
class ScreenshotDetailCell: UICollectionViewCell {
    // MARK: - Properties
    var resultImageString: String?{
        didSet { configure() }
    }
    private let screenshotImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.customMode()
        imageView.layer.cornerRadius = 12
        return imageView
    }()
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

// MARK: - Helpers
extension ScreenshotDetailCell {
    func style() {
        screenshotImageView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func layout() {
        addSubview(screenshotImageView)
        NSLayoutConstraint.activate([
            screenshotImageView.topAnchor.constraint(equalTo: topAnchor),
            screenshotImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            screenshotImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            screenshotImageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    private func configure() {
        guard let result = self.resultImageString else { return }
        let viewModel = ScreenshotDetailCellViewModel(result: result)
        screenshotImageView.kf.setImage(with: viewModel.imagrURL)
    }
}
