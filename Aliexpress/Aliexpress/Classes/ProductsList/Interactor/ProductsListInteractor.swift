//
//  ProductsListInteractor.swift
//  Aliexpress
//
//  Created by Johnson-Richie Louis on 26/01/2019.
//  Copyright © 2019 Johnson-Richie Louis. All rights reserved.
//

import Foundation

class ProductsListInteractor {
  
  // MARK: - Enum
  
  private enum Constants {
    static let sortValue = "BEST_MATCH"
    static let currencyValue = "EUR"
    static let limitValue = 20
    static let itemRemainingCount = 5
  }
  
  // MARK: - Property
  
  private var repository: ProductsListRepositoryInput
  private var categoryId: Int
  weak var output: ProductsListInteractorOutput!
  private var productItems: [ProductsListItem] = []
  private var aggregation: ProductsListAggregationItem?
  
  // MARK: - Lifecycle

  init(repository: ProductsListRepositoryInput, categoryId: Int) {
    self.repository = repository
    self.categoryId = categoryId
  }
  
  // MARK: - Private
  
  private func makeParameters(scrollIdentifier: String? = nil) -> ProductsListRepositoryParametersProtocol {
    return ProductsListRepositoryParameters(text: nil,
                                     sort: Constants.sortValue,
                                     currency: Constants.currencyValue,
                                     category: categoryId,
                                     skip: nil,
                                     limit: Constants.limitValue,
                                     scrollPagination: true,
                                     sortDirection: nil,
                                     scrollIdentifier: scrollIdentifier)
  }
  
  private func shouldRetrieveNext(atIndex index: Int, forCategoryIndex categoryIndex: Int) -> Bool {
    return index == productItems.count - 1 - Constants.itemRemainingCount
  }
  
  private func items(from response: ProductsListRepositoryResponseProtocol) -> [ProductsListItem] {
    let newItems: [ProductsListItem] = response.items?.compactMap {
      guard let id = $0.id, let title = $0.title else {
        return nil
      }
      return ProductsListItem(id: id,
                              title: title,
                              imageUrl: $0.imageUrl,
                              ratings: $0.ratings,
                              price: ProductsListPriceItem(currency: $0.price?.currency,
                                                           value: $0.price?.value))
      } ?? []
    return newItems
  }
  
  private func aggregation(from response: ProductsListRepositoryResponseProtocol) -> ProductsListAggregationItem {
    return ProductsListAggregationItem(totalCount: response.aggregation?.totalCount,
                                       skip: response.aggregation?.skip,
                                       limit: response.aggregation?.limit,
                                       scrollIdentifier: response.aggregation?.scrollIdentifier)
  }
}

// MARK: - ProductsListInteractorInput

extension ProductsListInteractor: ProductsListInteractorInput {
  
  func retrieve(atIndex index: Int, forCategoryIndex categoryIndex: Int) {
    guard shouldRetrieveNext(atIndex: index, forCategoryIndex: categoryIndex) else {
      return
    }

    guard let scrollIdentifier = aggregation?.scrollIdentifier else {
      return
    }
    let parameters = makeParameters(scrollIdentifier: scrollIdentifier)
    repository.fetch(with: parameters, success: { [weak self] response in
      let newItems = self?.items(from: response)
      self?.productItems = (self?.productItems ?? []) + (newItems ?? [])
      self?.aggregation = self?.aggregation(from: response)
      self?.output.didReceiveNext()
      }, failure: { _ in
        self.output.didReceiveError()
    })
  }
  
  
  func retrieve() {
    let parameters = makeParameters()
    repository.fetch(with: parameters, success: { [weak self] response in
      self?.productItems = self?.items(from: response) ?? []
      self?.aggregation = self?.aggregation(from: response)
      self?.output.didReceive()
    }, failure: { _ in
      self.output.didReceiveError()
    })
  }
  
  func numberOfCategories() -> Int {
    return 1
  }
  
  func numberOfItems(forCategoryIndex index: Int) -> Int {
    return productItems.count
  }
  
  func item(atIndex index: Int, forCategoryIndex categoryIndex: Int) -> ProductsListItemProtocol {
    return productItems[index]
  }
  
  func selectItem(atIndex index: Int, forCategoryIndex categoryIndex: Int) {
  }
}

// MARK: Private struct

private struct ProductsListRepositoryParameters: ProductsListRepositoryParametersProtocol {
  var text: String?
  var sort: String?
  var currency: String?
  var category: Int?
  var skip: Int?
  var limit: Int?
  var scrollPagination: Bool?
  var sortDirection: String?
  var scrollIdentifier: String?
}

private struct ProductsListItem: ProductsListItemProtocol {
  var id: String
  var title: String
  var imageUrl: String?
  var ratings: Float?
  var price: ProductsListPriceItemProtocol?
}

private struct ProductsListPriceItem: ProductsListPriceItemProtocol {
  var currency: String?
  var value: String?
}

private struct ProductsListAggregationItem: ProductsListAggregationItemProtocol {
  var totalCount: Int?
  var skip: Int?
  var limit: Int?
  var scrollIdentifier: String?
}
