//
//  UnsplashType.swift
//  UnsplashApp
//
//  Created by KEEN on 2021/06/26.
//

import Foundation

struct UnsplashType: Codable {
  let urls: Urls
}

struct Urls: Codable {
  let regular: String
  var regularUrl: URL {
    return URL(string: regular)!
  }
}
