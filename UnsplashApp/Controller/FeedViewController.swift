//
//  ViewController.swift
//  UnsplashApp
//
//  Created by KEEN on 2021/06/21.
//

import UIKit

class FeedViewController: UIViewController {
  
  // MARK: Properties
  let feedView = FeedView()
  
  // MARK: Life-Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    configure()
  }
  
  func configure() {
    view = feedView
    feedView.collectionView.dataSource = self
    feedView.collectionView.delegate = self
  }
}

// MARK: Delegate & DataSource
extension FeedViewController: UICollectionViewDelegate, UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 10
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FeedCollectionViewCell.cellIdentifier, for: indexPath) as? FeedCollectionViewCell else { return UICollectionViewCell() }
    cell.congifure()
    return cell
  }
  
}
