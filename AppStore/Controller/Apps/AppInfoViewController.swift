//
//  AppInfoViewController.swift
//  AppStore
//
//  Created by Zahra Alizada on 18.01.25.
//

import UIKit
private let reuseHeaderCellIdentifier = "HeaderCell"
private let reuseScreenshotCellIdentifier = "ScreenshotCell"
private let reuseRatingCellIdentifier = "RatingCell"
class AppInfoViewController: UICollectionViewController {
    // MARK: - Properties
    var results: [Result] = []{
        didSet{collectionView.reloadData()}
    }
    var resultsEntry: [Entry] = []{
        didSet{ collectionView.reloadData() }
    }
    var appId: String
    // MARK: - Lifecycle
    init(id: String) {
        self.appId = id
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
        fetchData(id: appId)
        fetchRatingsData(id: appId)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
    }
}

// MARK: - Service
extension AppInfoViewController {
    private func fetchData(id: String){
        SearchService.fetchDataId(id: id) { results in
            self.results = results
        }
    }
    private func fetchRatingsData(id: String){
        AppsService.fetchRatingsData(id: id) { resultsEntry in
            self.resultsEntry = resultsEntry
        }
    }
}

// MARK: - Helpers
extension AppInfoViewController {
    private func style() {
        self.navigationItem.largeTitleDisplayMode = .never
        collectionView.register(AppInfoHeaderCell.self, forCellWithReuseIdentifier: reuseHeaderCellIdentifier)
        collectionView.register(ScreenshotCell.self, forCellWithReuseIdentifier: reuseScreenshotCellIdentifier)
        collectionView.register(RatingsCell.self, forCellWithReuseIdentifier: reuseRatingCellIdentifier)
    }
}

// MARK: - UICollectionViewDataSource
extension AppInfoViewController{
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseHeaderCellIdentifier, for: indexPath) as! AppInfoHeaderCell
            cell.result = self.results.first
            return cell
        } else if indexPath.item == 1{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseScreenshotCellIdentifier, for: indexPath) as! ScreenshotCell
            cell.resultsImage = self.results.first?.screenshotUrls ?? []
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseRatingCellIdentifier, for: indexPath) as! RatingsCell
            cell.resultsEntry = self.resultsEntry
            return cell
        }
       
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension AppInfoViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.item == 0 {
            let cell = AppInfoHeaderCell(frame: .init(x: 0, y: 0, width: view.frame.width, height: 250))
            cell.result = self.results.first
            cell.layoutIfNeeded()
            let estimatedCell = cell.systemLayoutSizeFitting(.init(width: view.frame.width, height: 1000))
            return CGSize(width: view.frame.width - 10, height: estimatedCell.height)
        } else if indexPath.item == 1{
            return .init(width: view.frame.width - 10, height: 500)
        } else {
            return .init(width: view.frame.width - 10, height: 250)
        }
       
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 0, left: 10, bottom: 0, right: 0)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: 10)
    }
}
