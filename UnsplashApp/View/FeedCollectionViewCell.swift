//
//  FeedCollectionViewCell.swift
//  UnsplashApp
//
//  Created by KEEN on 2021/06/26.
//

import UIKit
import SnapKit

class FeedCollectionViewCell: UICollectionViewCell {
  
  // MARK: properties
  static var cellIdentifier = "feedCollectionViewCell"
  
  // MARK: UI
  let imageView: UnsplashView = {
    let v = UnsplashView()
    return v
  }()
  
  // MARK: Init
  override init(frame: CGRect) {
    super.init(frame: frame)
    addSubview(imageView)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
    imageView.image = nil
    imageView.backgroundColor = .white
  }
  
  // MARK: Configure
  override func layoutSubviews() {
    imageView.snp.makeConstraints { make in
      make.edges.equalTo(self)
    }
  }
}
