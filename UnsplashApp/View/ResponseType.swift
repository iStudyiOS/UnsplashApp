//
//  ResponseType.swift
//  UnsplashApp
//
//  Created by KEEN on 2021/07/06.
//

import Foundation

struct ResponseType: Decodable {
  var data: [UnsplashType]
  var page: Int
}
