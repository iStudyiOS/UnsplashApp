//
//  ViewController.swift
//  UnsplashApp
//
//  Created by KEEN on 2021/06/21.
//

import UIKit

class FeedViewController: UIViewController {
  
  // MARK: Properties
  var environment: Environment? = nil
  
  var unsplash: UnsplashType? = nil
  
  let feedView = FeedView()
  var picInfo = [UnsplashType]() {
    didSet {
      DispatchQueue.main.async {
        self.feedView.collectionView.reloadData()
//        print(self.picInfo[0].urls)
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
    if let url = URL(string: baseUrl) {
      URLSession.shared.dataTask(with: url) { (data, response, error) in
        if let error = error {
          print("Fetch - Error : \(error)")
        } else if let response = response as? HTTPURLResponse,
                  let data = data {
          print("Status Code: \(response.statusCode)")
          
          do {
            let decoder = JSONDecoder()
            let picInfo = try decoder.decode([UnsplashType].self, from: data)
            self.picInfo.append(contentsOf: picInfo)
          } catch {
            print(error)
          }
        }
      }.resume()
    }
  }
  
  // MARK: Action
  @objc func onFavorite(_ sender: UIButton) {
    sender.isSelected.toggle()
    
    guard let repo = self.environment?.imageRepository else { return }
    guard let unsplash = self.unsplash else { return }
    
    switch sender.isSelected {
    case true:
      repo.add(item: unsplash)
      sender.image(for: .selected)
    case false:
      repo.remove(item: unsplash)
      sender.image(for: .normal)
    }
    print("count: ", repo.count)
  }
}

// MARK: Delegate & DataSource
extension FeedViewController: UICollectionViewDelegate, UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return picInfo.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FeedCollectionViewCell.cellIdentifier, for: indexPath) as? FeedCollectionViewCell else { return UICollectionViewCell() }
    cell.congifure(unsplash: picInfo[indexPath.row])
    
    cell.favoriteButton.tag = indexPath.row
    cell.favoriteButton.addTarget(self, action: #selector(onFavorite), for: .touchUpInside)
      
    return cell
  }
  
}
