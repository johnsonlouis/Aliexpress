//
//  AliexpressApiConnector.swift
//  Aliexpress
//
//  Created by Johnson-Richie Louis on 26/01/2019.
//  Copyright © 2019 Johnson-Richie Louis. All rights reserved.
//

import Foundation
import Alamofire

struct AliexpressApiConnector: ApiConnector {
  
  func request(with request: ApiRequestProtocol, success: @escaping (ApiResponseProtocol) -> Void, failure: @escaping (ApiError) -> Void) {
    Alamofire.request(request.endpoint,
                      method: request.method == .post ? .post : .get,
                      parameters: request.parameters,
                      encoding: JSONEncoding.default,
                      headers: request.headers).validate().responseData { response in
                        switch response.result {
                        case .success:
                          guard let data = response.data, let statusCode = response.response?.statusCode else {
                            failure(.unknown)
                            return
                          }
                          success(ApiResponse(data: data, statusCode: statusCode))
                        case .failure( _):
                          guard let statusCode = response.response?.statusCode else {
                            failure(.unknown)
                            return
                          }
                          failure(ApiError(statusCode: statusCode))
                        }
    }
  }
}

private struct ApiResponse: ApiResponseProtocol {
  var data: Data
  var statusCode: Int
}
