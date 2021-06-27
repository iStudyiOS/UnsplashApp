//
//  APIKEY.swift
//  UnsplashApp
//
//  Created by KEEN on 2021/06/27.
//

import Foundation

extension Bundle {
  var apikey: String {
    guard let file = self.path(forResource: "APIKEY", ofType: "plist") else { return "" }
    
    guard let resource = NSDictionary(contentsOfFile: file) else { return "" }
    guard let key = resource["API_KEY"] as? String else {
      fatalError("APIKEY.plist에 API_KEY를 설정해주세요.")
    }
    return key
  }
}
