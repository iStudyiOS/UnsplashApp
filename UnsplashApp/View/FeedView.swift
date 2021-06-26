//
//  FeedView.swift
//  UnsplashApp
//
//  Created by KEEN on 2021/06/26.
//

import UIKit
import SnapKit

class FeedView: UIView {
  
  // MARK: Properties
  struct Metric {
    static var screenSize = UIScreen.main.bounds
    static var screenWidth = screenSize.width
    static var screenHeight = screenSize.height
  }
  
  // MARK: UI
  lazy var collectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .vertical
    layout.minimumLineSpacing = 0
    layout.minimumInteritemSpacing = 0
    layout.itemSize = CGSize(width: Metric.screenWidth / 2, height: Metric.screenHeight / 2)
    
    let v = UICollectionView(frame: .zero, collectionViewLayout: layout)
    v.backgroundColor = .white
    v.register(FeedCollectionViewCell.self, forCellWithReuseIdentifier: FeedCollectionViewCell.cellIdentifier)
    return v
  }()
  
  // MARK: Init
  override init(frame: CGRect) {
    super.init(frame: frame)
    addSubview(collectionView)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: Configure
  override func layoutSubviews() {
    collectionView.snp.makeConstraints { make in
      make.edges.equalTo(self)
    }
  }
}
