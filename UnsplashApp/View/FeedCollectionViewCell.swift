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
    v.layer.cornerRadius = 8
    v.translatesAutoresizingMaskIntoConstraints = false
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
  }
  
  // MARK: Layout
  override func layoutSubviews() {
    imageView.snp.makeConstraints { make in
      make.edges.equalToSuperview().inset(6)
    }
  }
  
  // MARK: Cell Configure
  func congifure() {
    imageView.image = UIImage(named: "loading_image")
    imageView.backgroundColor = .white
  }
}
