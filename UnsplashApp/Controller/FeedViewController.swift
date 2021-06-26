//
//  ViewController.swift
//  UnsplashApp
//
//  Created by KEEN on 2021/06/21.
//

import UIKit

class FeedViewController: UIViewController {
  
  let feedView = FeedView()
  
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

extension FeedViewController: UICollectionViewDelegate, UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 10
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FeedCollectionViewCell.cellIdentifier, for: indexPath) as? FeedCollectionViewCell else { return UICollectionViewCell() }
    
    cell.imageView.image = UIImage(named: "loading_image")
    return cell
  }
  
  
}
