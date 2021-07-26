//
//  UnsplashAPI.swift
//  UnsplashApp
//
//  Created by KEEN on 2021/07/06.
//

import Foundation
import Moya

enum UnsplashAPI {
  case random(order_by: String, per_page: Int)
}

extension UnsplashAPI: TargetType {
  var headers: [String : String]? { return nil }
  var baseURL: URL { return URL(string: "https://api.unsplash.com/photos")! }
  var method: Moya.Method { return .get }
  
  var path: String {
    switch self {
    case .random:
      return "/random"
    }
  }
  
  var task: Task {
    switch self {
    case .random(let order, let perPage):
      return .requestParameters(
        parameters: [
          "client_id": Bundle.main.apikey,
          "order_by": order,
          "per_page": perPage
        ],
        encoding: URLEncoding.default)
    }
  }

  var sampleData: Data { return Data() }
}
