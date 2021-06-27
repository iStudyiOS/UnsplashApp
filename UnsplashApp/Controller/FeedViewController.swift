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
  var picInfo = [UnsplashType]() {
    didSet {
      DispatchQueue.main.async {
        self.feedView.collectionView.reloadData()
        print(self.picInfo[0].urls)
      }
    }
  }
  
  // MARK: Life-Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    configure()
    fetchImages()
  }
  
  func configure() {
    self.title = "Feed"
    self.navigationController?.navigationBar.prefersLargeTitles = true
    view = feedView
    feedView.collectionView.dataSource = self
    feedView.collectionView.delegate = self
  }
  
  // MARK: Fetch
  func fetchImages() {
    let baseUrl = "https://api.unsplash.com/photos/?client_id=\(Bundle.main.apikey)&order_by=ORDER&per_page=30"
  }
}

// MARK: Delegate & DataSource
extension FeedViewController: UICollectionViewDelegate, UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 21
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FeedCollectionViewCell.cellIdentifier, for: indexPath) as? FeedCollectionViewCell else { return UICollectionViewCell() }
    cell.congifure()
    return cell
  }
  
}
