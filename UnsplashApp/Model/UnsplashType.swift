//
//  UnsplashType.swift
//  UnsplashApp
//
//  Created by KEEN on 2021/06/26.
//

import Foundation

struct UnsplashType: Codable {
  let urls: Urls?
  let id: String?
  
  enum CodingKeys: String, CodingKey {
    case id = "id"
    case urls = "urls"
  }
  
  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    id = try values.decodeIfPresent(String.self, forKey: .id)
    urls = try values.decodeIfPresent(Urls.self, forKey: .urls)
  }
}

struct Urls: Codable {
  let regular: String
  var regularUrl: URL {
    return URL(string: regular)!
  }
}
