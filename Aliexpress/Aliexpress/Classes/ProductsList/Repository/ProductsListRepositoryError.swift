//
//  ProductsListRepositoryError.swift
//  Aliexpress
//
//  Created by Johnson-Richie Louis on 26/01/2019.
//  Copyright © 2019 Johnson-Richie Louis. All rights reserved.
//

import Foundation

enum ProductsListRepositoryError: Error {
  case forbidden
  case requestBody
  case allowableCallCount
  case server
  case technical
}
