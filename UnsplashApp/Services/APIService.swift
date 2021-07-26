//
//  APIService.swift
//  UnsplashApp
//
//  Created by KEEN on 2021/07/06.
//

import Moya

protocol APIServiceType {
  func ramdom(per_page: Int, completion: @escaping (Result<ResponseType, ErrorType>) -> Void)
}

class APIService: APIServiceType {
  private let provider = MoyaProvider<UnsplashAPI>()
  
  func ramdom(per_page: Int, completion: @escaping (Result<ResponseType, ErrorType>) -> Void) {
    provider.request(.random(order_by: "ORDER", per_page: per_page)) { result in
      switch result {
      case .success(let response):
        guard let data = try? response.filter(statusCode: 200).map(ResponseType.self) else {
          completion(.failure(.jsonDecode))
          return
        }
        completion(.success(data))
      case .failure(_):
        completion(.failure(.network))
      }
    }
  }
}
