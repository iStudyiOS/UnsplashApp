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
    v.layer.borderWidth = 1
    v.layer.borderColor = UIColor(named: "mainColor")?.cgColor
    v.clipsToBounds = true
    v.translatesAutoresizingMaskIntoConstraints = false
    return v
  }()
  
  let favoriteButton: UIButton = {
    let v = UIButton()
    v.tintColor = .red
    v.setImage(UIImage(systemName: "star"), for: .normal)
    v.setImage(UIImage(systemName: "star.fill"), for: .selected)
    v.translatesAutoresizingMaskIntoConstraints = false
    return v
  }()
  
  // MARK: Init
  override init(frame: CGRect) {
    super.init(frame: frame)
    addSubview(imageView)
    addSubview(favoriteButton)
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
    favoriteButton.snp.makeConstraints { make in
      make.trailing.top.equalToSuperview().inset(10)
      make.height.width.equalTo(20)
    }
  }
  
  // MARK: Cell Configure
  func congifure() {
    imageView.image = UIImage(named: "loading_image")?.withTintColor(UIColor(named: "mainColor")!)
    imageView.backgroundColor = .white
  }
}
