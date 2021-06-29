//
//  UnsplashView.swift
//  UnsplashApp
//
//  Created by KEEN on 2021/06/26.
//

import UIKit

class UnsplashView: UIImageView {
  
  static var cache = NSCache<AnyObject, UIImage>()
  var url: URL?
  
  func loadImages(from url: URL) {
    self.url = url
    
    if let cachedImage = UnsplashView.cache.object(forKey: url as AnyObject) {
      self.image = cachedImage
      print("It's cahcedImage.")
    } else {
      URLSession.shared.dataTask(with: url) { (data, response, error) in
        if let error = error {
          print("UnsplashView - Error: \(error)")
        } else if let data = data {
          if url == self.url {
            DispatchQueue.main.async {
              self.image = UIImage(data: data)
              UnsplashView.cache.setObject(self.image!, forKey: url as AnyObject)
//              print("Image form \(url)")
            }
          } else {
            print("url is not correct.")
          }
        }
      }.resume()
    }
  }
}
