//
//  ApiConnector.swift
//  Aliexpress
//
//  Created by Johnson-Richie Louis on 26/01/2019.
//  Copyright © 2019 Johnson-Richie Louis. All rights reserved.
//

import Foundation

/// sourcery: AutoMockable
protocol ApiConnector {
  func request(with request: ApiRequestProtocol,
               success: @escaping (ApiResponseProtocol) -> Void,
               failure: @escaping (ApiError) -> Void)
}

enum ApiError: Error {
  
  private enum ErrorCode {
    static let forbidden = 403
    static let requestBody = 422
    static let allowableCallCount = 429
    static let server = 500
  }
  
  case forbidden //Forbidden access (may not have access to an API): code 403
  case requestBody //Problem with the request body: code 422
  case allowableCallCount //Exceeded the allowable call count (upgrade your subscription): code 429
  case server //Internal server problem (contact us if this persists): code 500
  case other(Int)
  case unknown
  
  init(statusCode: Int) {
    switch statusCode {
    case ErrorCode.forbidden: self = .forbidden
    case ErrorCode.requestBody: self = .requestBody
    case ErrorCode.allowableCallCount: self = .allowableCallCount
    case ErrorCode.server: self = .server
    default: self = .other(statusCode)
    }
  }
}

/// sourcery: AutoMockable
protocol ApiRequestProtocol {
  var endpoint: String { get }
  var method: ApiMethod { get }
  var parameters: [String: Any]? { get }
  var headers: [String: String]? { get }
}

enum ApiMethod {
  case post
  case get
}

/// sourcery: AutoMockable
protocol ApiResponseProtocol {
  var data: Data { get }
  var statusCode: Int { get }
}
