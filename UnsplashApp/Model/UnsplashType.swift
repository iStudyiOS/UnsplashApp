//
//  UnsplashType.swift
//  UnsplashApp
//
//  Created by KEEN on 2021/06/26.
//

import Foundation
import Realm
import RealmSwift

class UnsplashType: Object, Decodable {
  @objc dynamic var urls: String
  @objc dynamic var id: String
  @objc dynamic var isEnable: Bool
  @objc dynamic var date: Date
  
  override class func primaryKey() -> String? {
    return "id"
  }
  
  enum CodingKeys: String, CodingKey {
    case id
    case urls
  }
  
  enum ImageKeys: String, CodingKey {
    case regular
  }
  
  required init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    self.id = try values.decode(String.self, forKey: .id)
    self.isEnable = false
    
    let images = try values.nestedContainer(keyedBy: ImageKeys.self, forKey: .urls)
    self.urls = try images.decode(String.self, forKey: .regular)
    self.date = Date()
  }
  
  required override init() {
    id = ""
    urls = ""
    isEnable = false
    date = Date()
  }
}

class Urls: Object, Codable {
  @objc dynamic var regular: String
  @objc dynamic var regularUrl: URL {
    return URL(string: regular)!
  }
}

