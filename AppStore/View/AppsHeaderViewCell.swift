//
//  AppsHeaderViewCell.swift
//  AppsHeaderViewCell
//
//  Created by Zahra Alizada on 16.01.25.
//

import UIKit
import Kingfisher

class AppsHeaderViewCell: UICollectionViewCell {
    // MARK: Properties
    var appHeaderModel: AppHeaderModel?{
        didSet { configure() }
    }
    private let appImage: UIImageView = {
        let imageView = UIImageView()
        imageView.customMode()
        imageView.backgroundColor = .cyan
        return imageView
    }()
    private let firmLabel: UILabel = {
        let label = UILabel()
        label.text = "Linkedin"
        label.textColor = .blue
        return label
    }()
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "init(coder:) has not been implemented init(coder) has not been implemented"
        return label
    }()
    private var stackview: UIStackView!
    
    // MARK: Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        style()
        layout()
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AppsHeaderViewCell {
    private func style() {
        stackview = UIStackView(arrangedSubviews: [firmLabel,titleLabel,appImage])
        stackview.axis = .vertical
        stackview.spacing = 12
        stackview.translatesAutoresizingMaskIntoConstraints = false
    }
    private func layout() {
        addSubview(stackview)
        NSLayoutConstraint.activate([
            stackview.topAnchor.constraint(equalTo: topAnchor),
            stackview.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackview.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackview.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    private func configure() {
        guard let result = self.appHeaderModel else { return }
        let viewModel = AppsHeaderViewModel(result: result)
        self.titleLabel.text = viewModel.title
        self.firmLabel.text = viewModel.name
        self.appImage.kf.setImage(with: viewModel.imageUrl)
    }
    
}
