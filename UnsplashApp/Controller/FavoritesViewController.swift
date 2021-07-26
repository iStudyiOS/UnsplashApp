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
  let favoriteItems = [UnsplashType]()
  
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
    if favoriteItems.count == 0 {
      let emptyLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: self.view.bounds.size.height))
      emptyLabel.text = "0 Favorites :( Add your Favorites!"
      emptyLabel.textColor = .orange
      emptyLabel.font = .boldSystemFont(ofSize: 23)
      emptyLabel.textAlignment = .center
      collectionView.backgroundView = emptyLabel
      emptyLabel.backgroundColor = .white
      return 0
    } else {
      return favoriteItems.count
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FeedCollectionViewCell.cellIdentifier, for: indexPath) as? FeedCollectionViewCell else { return UICollectionViewCell() }
    cell.congifure(unsplash: favoriteItems[indexPath.row])
    return cell
  }
}
