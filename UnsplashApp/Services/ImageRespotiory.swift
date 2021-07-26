//
//  ImageRespotiory.swift
//  UnsplashApp
//
//  Created by KEEN on 2021/06/27.
//

import Foundation
import Realm
import RealmSwift

protocol ImageRepositoryType {
  var count: Int { get }
  func add(item: UnsplashType)
  func remove(item: UnsplashType)
  func fetch() -> [UnsplashType]
}

final class ImageRepository: ImageRepositoryType {
  private let realm: Realm
  
  init(realm: Realm) {
    self.realm = realm
  }
  
  var count: Int {
    return realm.objects(UnsplashType.self).filter("isEnable = true").count
  }
  
  func add(item: UnsplashType) {
    if let exist = realm.objects(UnsplashType.self).filter("id = '\(item.id)'").first {
      try! realm.write { exist.isEnable = true }
      return
    }
    
    item.isEnable = true
    try! realm.write { realm.add(item) }
  }
  
  func remove(item: UnsplashType) {
    try! realm.write { item.isEnable = false }
  }
  
  func fetch() -> [UnsplashType] {
    return realm.objects(UnsplashType.self).filter("isEnable = true").map { $0 }
  }
}
