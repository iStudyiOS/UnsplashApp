//
//  FavoritesViewController.swift
//  UnsplashApp
//
//  Created by KEEN on 2021/06/26.
//

import UIKit

class FavoritesViewController: UIViewController {
  
  // MARK: Properties
  var environment: Environment? = nil
  var gridViewDelegate: GridViewDelegate? = nil
  let favoriteView = FeedView()
  var favoriteItems = [UnsplashType]()
  
  // MARK: Life-Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    configure()
    
    NotificationCenter.default.addObserver(
      self,
      selector: #selector(onRepoUpdate),
      name: .UpdateRepo,
      object: nil)
    
    toggleEmptyView()
  }
  
  func configure() {
    self.view.backgroundColor = .yellow // temporary code.
    self.title = "Favorites"
    self.navigationController?.navigationBar.prefersLargeTitles = true
    view = favoriteView
  }
  
  func showEmptyView() {
    let emptyLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: self.view.bounds.size.height))
    emptyLabel.text = "0 Favorites :( Add your Favorites!"
    emptyLabel.textColor = .white
    emptyLabel.font = .boldSystemFont(ofSize: 23)
    emptyLabel.textAlignment = .center
    view.addSubview(emptyLabel)
    // constraints
    emptyLabel.snp.makeConstraints { make in
      make.centerX.centerY.equalToSuperview()
    }
  }
  
  @objc private func onRepoUpdate() {
    favoriteView.updateView(data: environment?.imageRepository.fetch() ?? [])
  }
  
  func toggleEmptyView() {
    guard let env = environment else { return }
    if env.imageRepository.count > 0 {
      showEmptyView()
    } else {
      onRepoUpdate()
    }
  }
}

// MARK: Delegate & DataSource
extension FavoritesViewController: UICollectionViewDelegate, UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return favoriteItems.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FeedCollectionViewCell.cellIdentifier, for: indexPath) as? FeedCollectionViewCell else { return UICollectionViewCell() }
    cell.congifure(unsplash: favoriteItems[indexPath.row])
    return cell
  }
  
  func collectionView(
    _ collectionView: UICollectionView,
    didSelectItemAt indexPath: IndexPath) {
    gridViewDelegate?.onSelected(item: favoriteItems[indexPath.row])
  }
}
