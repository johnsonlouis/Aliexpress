//
//  ProductsListRepositoryInput.swift
//  Aliexpress
//
//  Created by Johnson-Richie Louis on 26/01/2019.
//  Copyright © 2019 Johnson-Richie Louis. All rights reserved.
//

import Foundation

/// sourcery: AutoMockable
protocol ProductsListRepositoryInput {
  func fetch(with parameters: ProductsListRepositoryParametersProtocol,
             success: @escaping (ProductsListRepositoryResponseProtocol) -> Void,
             failure: @escaping (ProductsListRepositoryError) -> Void)
}

/// sourcery: AutoMockable
protocol ProductsListRepositoryParametersProtocol {
  var text: String? { get }
  var sort: String? { get }
  var currency: String? { get }
  var category: Int? { get }
  var skip: Int? { get }
  var limit: Int? { get }
  var scrollPagination: Bool? { get }
  var sortDirection: String? { get }
}
