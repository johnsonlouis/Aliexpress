//
//  ProductsListRepository.swift
//  Aliexpress
//
//  Created by Johnson-Richie Louis on 26/01/2019.
//  Copyright © 2019 Johnson-Richie Louis. All rights reserved.
//

import Foundation

class ProductsListRepository {
  
  // MARK: - Enum
  
  enum Constants {
    static let endpoint = "https://api.aliseeks.com/v1/search/realtime"
    static let apikey = "JXZVXDBYNZVVIBVL"
    static let contentType = "application/json"
  }
  
  enum Keys {
    static let text = "text"
    static let sort = "sort"
    static let currency = "currency"
    static let category = "category"
    static let scrollPagination = "scrollPagination"
    static let limit = "limit"
    static let skip = "skip"
    static let sortDirection = "sortDirection"
    static let contentType = "Content-Type"
    static let apiClientId = "X-API-CLIENT-ID"
  }
  
  // MARK: - Property
  private var apiConnector: ApiConnector
  
  // MARK: - Lifecycle

  init(apiConnector: ApiConnector) {
    self.apiConnector = apiConnector
  }
  
  // MARK: - Private
  
  private func makeRequest(from parameters: ProductsListRepositoryParametersProtocol) -> ApiRequestProtocol {
    return ApiRequest(endpoint: Constants.endpoint,
                      method: .post,
                      parameters: convert(parameters: parameters),
                      headers: [Keys.apiClientId: Constants.apikey,
                                Keys.contentType: Constants.contentType])
  }
  
  private func convert(parameters: ProductsListRepositoryParametersProtocol) -> [String: Any]? {
    var parametersDictionary: [String: Any] = [:]
    if let text = parameters.text { parametersDictionary[Keys.text] = text }
    if let sort = parameters.sort { parametersDictionary[Keys.sort] = sort }
    if let currency = parameters.currency { parametersDictionary[Keys.currency] = currency }
    if let category = parameters.category { parametersDictionary[Keys.category] = category }
    if let scrollPagination = parameters.scrollPagination { parametersDictionary[Keys.scrollPagination] = scrollPagination }
    if let limit = parameters.limit { parametersDictionary[Keys.limit] = limit }
    if let skip = parameters.skip { parametersDictionary[Keys.skip] = skip }
    if let sortDirection = parameters.sortDirection { parametersDictionary[Keys.sortDirection] = sortDirection }
    return !parametersDictionary.isEmpty ? parametersDictionary : nil
  }
  
  private func convert(aggregation: ProductAggregation?) -> ProductsListRepositoryProductAggregationResponseProtocol? {
    return ProductsListRepositoryProductAggregationResponse(totalCount: aggregation?.totalCount,
                                                            skip: aggregation?.skip,
                                                            limit: aggregation?.limit,
                                                            scrollIdentifier: aggregation?.scrollIdentifier)
  }
  
  private func convert(items: [ProductItem]?) -> [ProductsListRepositoryProductItemResponseProtocol]? {
    return items?.map {
      ProductsListRepositoryProductItemResponse(id: $0.id,
                                                title: $0.title,
                                                imageUrl: $0.imageUrl,
                                                ratings: $0.ratings,
                                                price: ProductsListRepositoryProductPriceResponse(currency: $0.price?.currency,
                                                                                                  value: $0.price?.value)
      )
    }
  }
}

// MARK: - ProductsListRepositoryInput

extension ProductsListRepository: ProductsListRepositoryInput {
  
  func fetch(with parameters: ProductsListRepositoryParametersProtocol, success: @escaping (ProductsListRepositoryResponseProtocol) -> Void, failure: @escaping (ProductsListRepositoryError) -> Void) {
    let request = makeRequest(from: parameters)
    apiConnector.request(with: request, success: { apiResponse in
      guard let productsList = try? JSONDecoder().decode(ProductsList.self, from: apiResponse.data) else {
        failure(.technical)
        return
      }
      let repositoryResponse = ProductsListRepositoryResponse(aggregation: self.convert(aggregation: productsList.aggregation),
                                                              items: self.convert(items: productsList.items))
      success(repositoryResponse)
    }, failure: { error in
      switch error {
      case .forbidden: failure(.forbidden)
      case .requestBody: failure(.requestBody)
      case .allowableCallCount: failure(.allowableCallCount)
      case .server: failure(.server)
      default: failure(.technical)
      }
    })
  }
}

// MARK: - Private Struct

private struct ApiRequest: ApiRequestProtocol {
  var endpoint: String
  var method: ApiMethod
  var parameters: [String : Any]?
  var headers: [String : String]?
}

private struct ProductsListRepositoryResponse: ProductsListRepositoryResponseProtocol {
  var aggregation: ProductsListRepositoryProductAggregationResponseProtocol?
  var items: [ProductsListRepositoryProductItemResponseProtocol]?
}

private struct ProductsListRepositoryProductAggregationResponse: ProductsListRepositoryProductAggregationResponseProtocol {
  var totalCount: Int?
  var skip: Int?
  var limit: Int?
  var scrollIdentifier: String?
}

private struct ProductsListRepositoryProductItemResponse: ProductsListRepositoryProductItemResponseProtocol {
  var id: String?
  var title: String?
  var imageUrl: String?
  var ratings: Float?
  var price: ProductsListRepositoryProductPriceResponseProtocol?
}

private struct ProductsListRepositoryProductPriceResponse: ProductsListRepositoryProductPriceResponseProtocol {
  var currency: String?
  var value: String?
}
