//
//  FavoritesViewController.swift
//  UnsplashApp
//
//  Created by KEEN on 2021/06/26.
//

import UIKit

class FavoritesViewController: UIViewController {
  
  // MARK: Properties
  let favoriteView = FeedView()
  
  // MARK: Life-Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    configure()
  }
  
  func configure() {
    self.view.backgroundColor = .yellow // temporary code.
    self.title = "Favorites"
    self.navigationController?.navigationBar.prefersLargeTitles = true
    view = favoriteView
    favoriteView.collectionView.dataSource = self
    favoriteView.collectionView.delegate = self
  }
}

// MARK: Delegate & DataSource
extension FavoritesViewController: UICollectionViewDelegate, UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 10
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FeedCollectionViewCell.cellIdentifier, for: indexPath) as? FeedCollectionViewCell else { return UICollectionViewCell() }
    cell.congifure()
    return cell
  }
}
