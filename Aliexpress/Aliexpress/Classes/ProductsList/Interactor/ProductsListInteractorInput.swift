//
//  ProductsListInteractorInput.swift
//  Aliexpress
//
//  Created by Johnson-Richie Louis on 26/01/2019.
//  Copyright © 2019 Johnson-Richie Louis. All rights reserved.
//

import Foundation

/// sourcery: AutoMockable
protocol ProductsListInteractorInput {
  func retrieve()
  func retrieve(atIndex index: Int, forCategoryIndex categoryIndex: Int)
  func numberOfCategories() -> Int
  func numberOfItems(forCategoryIndex index: Int) -> Int
  func item(atIndex index: Int, forCategoryIndex categoryIndex: Int) -> ProductsListItemProtocol
  func selectItem(atIndex index: Int, forCategoryIndex categoryIndex: Int)
}

/// sourcery: AutoMockable
protocol ProductsListItemProtocol {
  var id: String { get }
  var title: String { get }
  var imageUrl: String? { get }
  var ratings: Float? { get }
  var price: ProductsListPriceItemProtocol? { get }
}

/// sourcery: AutoMockable
protocol ProductsListPriceItemProtocol {
  var currency: String? { get }
  var value: String? { get }
}

/// sourcery: AutoMockable
protocol ProductsListAggregationItemProtocol {
  var totalCount: Int? { get }
  var skip: Int? { get }
  var limit: Int? { get }
  var scrollIdentifier: String? { get }
}
