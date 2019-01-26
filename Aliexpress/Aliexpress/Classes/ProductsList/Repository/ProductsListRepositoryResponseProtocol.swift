//
//  ProductsListRepositoryResponseProtocol.swift
//  Aliexpress
//
//  Created by Johnson-Richie Louis on 26/01/2019.
//  Copyright © 2019 Johnson-Richie Louis. All rights reserved.
//

import Foundation

/// sourcery: AutoMockable
protocol ProductsListRepositoryResponseProtocol {
  var aggregation: ProductsListRepositoryProductAggregationResponseProtocol? { get }
  var items: [ProductsListRepositoryProductItemResponseProtocol]? { get }
}

/// sourcery: AutoMockable
protocol ProductsListRepositoryProductAggregationResponseProtocol {
  var totalCount: Int? { get }
  var skip: Int? { get }
  var limit: Int? { get }
  var scrollIdentifier: String? { get }
}

/// sourcery: AutoMockable
protocol ProductsListRepositoryProductItemResponseProtocol {
  var id: String? { get }
  var title: String? { get }
  var imageUrl: String? { get }
  var ratings: Float? { get }
  var price: ProductsListRepositoryProductPriceResponseProtocol? { get }
}

/// sourcery: AutoMockable
protocol ProductsListRepositoryProductPriceResponseProtocol {
  var currency: String? { get }
  var value: String? { get }
}
