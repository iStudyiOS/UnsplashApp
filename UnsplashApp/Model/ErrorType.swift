//
//  ErrorType.swift
//  UnsplashApp
//
//  Created by KEEN on 2021/07/06.
//

import UIKit

enum ErrorType: Error {
  case jsonDecode
  case network
}

extension ErrorType {
  var localizedDescription: String {
    switch self {
    case .jsonDecode:
      return "네트워크 응답 처리 실패"
    case .network:
      return "네트워크 연결 실패"
    }
  }
}
