//
//  ProductsListInteractorTests.swift
//  AliexpressTests
//
//  Created by Johnson-Richie Louis on 26/01/2019.
//  Copyright © 2019 Johnson-Richie Louis. All rights reserved.
//

import Foundation
import XCTest
import Nimble
@testable import Aliexpress

class ProductsListInteractorTests: XCTestCase {
  
  private var interactor: ProductsListInteractor!
  private var repository: ProductsListRepositoryInputMock!
  private var categoryId: Int!
  private var output: ProductsListInteractorOutputMock!
  
  override func setUp() {
    super.setUp()
    categoryId = 999
    repository = ProductsListRepositoryInputMock()
    interactor = ProductsListInteractor(repository: repository, categoryId: categoryId)
    output = ProductsListInteractorOutputMock()
    interactor.output = output
  }
  
  override func tearDown() {
    interactor = nil
    output = nil
    categoryId = nil
    repository = nil
    super.tearDown()
  }
  
  func test_whenRetrieve_thenRepositoryFetchCalled() {
    // When
    interactor.retrieve()
    
    // Then
    expect(self.repository.fetchWithSuccessFailureCallsCount).to(equal(1))
  }
  
  func test_whenRetrieveAtIndexForCategoryIndex_thenOutputDidReceiveNextCalled() {
    // Given
    let response = ProductsListRepositoryResponseProtocolMock.stub()
    
    let aggregation = ProductsListRepositoryProductAggregationResponseProtocolMock()
    aggregation.scrollIdentifier = "scrollIdentifier"
    response.aggregation = aggregation
    
    repository.fetchWithSuccessFailureClosure = { _, success, _ in
      success(response)
    }
    
    interactor.retrieve()
    
    // When
    interactor.retrieve(atIndex: 9, forCategoryIndex: 0)
    
    // Then
    expect(self.output.didReceiveCallsCount).to(equal(1))
    expect(self.repository.fetchWithSuccessFailureCallsCount).to(equal(2))
    expect(self.output.didReceiveNextCallsCount).to(equal(1))
  }
  
  func test_whenRetrieveAtIndexForCategoryIndex_thenOutputDidReceiveNextNotCalled() {
    // Given
    let response = ProductsListRepositoryResponseProtocolMock.stub()
    
    let aggregation = ProductsListRepositoryProductAggregationResponseProtocolMock()
    aggregation.scrollIdentifier = "scrollIdentifier"
    response.aggregation = aggregation
    
    repository.fetchWithSuccessFailureClosure = { _, success, failure in
      success(response)
    }
    
    interactor.retrieve()
    
    // When
    interactor.retrieve(atIndex: 11, forCategoryIndex: 0)
    
    // Then
    expect(self.output.didReceiveCallsCount).to(equal(1))
    expect(self.repository.fetchWithSuccessFailureCallsCount).to(equal(1))
    expect(self.output.didReceiveNextCallsCount).to(equal(0))
  }
  
  func test_whenRetrieveAtIndexForCategoryIndex_withoutScrollIdentifier_thenOutputDidReceiveNextNotCalled() {
    // Given
    let response = ProductsListRepositoryResponseProtocolMock()
    var items: [ProductsListRepositoryProductItemResponseProtocol] = []
    for _ in 1...15 {
      let item = ProductsListRepositoryProductItemResponseProtocolMock()
      item.id = "id"
      item.title = "title"
      items.append(item)
    }
    response.items = items
    
    let aggregation = ProductsListRepositoryProductAggregationResponseProtocolMock()
    aggregation.scrollIdentifier = nil
    response.aggregation = aggregation
    
    repository.fetchWithSuccessFailureClosure = { _, success, failure in
      success(response)
    }
    
    // When
    interactor.retrieve(atIndex: 11, forCategoryIndex: 0)
    
    // Then
    expect(self.output.didReceiveNextCallsCount).to(equal(0))
  }
  
  func test_numberOfCategories() {
    // When
    let result = interactor.numberOfCategories()
    
    // Then
    expect(result).to(equal(1))
  }
  
  func test_numberOfItemsForCategoryIndex() {
    // Given
    let response = ProductsListRepositoryResponseProtocolMock.stub()
    
    repository.fetchWithSuccessFailureClosure = { _, success, _ in
      success(response)
    }
    
    interactor.retrieve()
    
    // When
    let result = interactor.numberOfItems(forCategoryIndex: 0)
    
    // Then
    expect(result).to(equal(15))
  }
  
  func test_itemAtIndexForCategoryIndex() {
    // Given
    let response = ProductsListRepositoryResponseProtocolMock.stub()
    
    repository.fetchWithSuccessFailureClosure = { _, success, _ in
      success(response)
    }
    
    interactor.retrieve()
    
    // When
    let result = interactor.item(atIndex: 0, forCategoryIndex: 0)
    
    // Then
    expect(result).toNot(beNil())
    expect(result.id).to(equal("id"))
    expect(result.title).to(equal("title"))
    expect(result.imageUrl).to(beNil())
    expect(result.price).toNot(beNil())
    expect(result.ratings).to(beNil())
  }
  
  func test_whenRetrieve_thenDidReceiveErrorCalled() {
    // Given    
    repository.fetchWithSuccessFailureClosure = { _, _, failure in
      failure(.forbidden)
    }
    
    interactor.retrieve()
    
    // Then
    expect(self.output.didReceiveErrorCallsCount).to(equal(1))
  }
  
  func test_whenRetrieveAtIndex_thenDidReceiveErrorCalled() {
    // Given
    // Given
    let response = ProductsListRepositoryResponseProtocolMock.stub()
    
    let aggregation = ProductsListRepositoryProductAggregationResponseProtocolMock()
    aggregation.scrollIdentifier = "scrollIdentifier"
    response.aggregation = aggregation
    
    repository.fetchWithSuccessFailureClosure = { _, success, _ in
      success(response)
    }
    
    interactor.retrieve()
    
    repository.fetchWithSuccessFailureClosure = { _, _, failure in
      failure(.requestBody)
    }
    
    // When
    interactor.retrieve(atIndex: 9, forCategoryIndex: 0)
    
    // Then
    expect(self.output.didReceiveErrorCallsCount).to(equal(1))
  }
}


extension ProductsListRepositoryResponseProtocolMock {
  
  static func stub() -> ProductsListRepositoryResponseProtocolMock {
    let response = ProductsListRepositoryResponseProtocolMock()
    var items: [ProductsListRepositoryProductItemResponseProtocol] = []
    for _ in 1...15 {
      let item = ProductsListRepositoryProductItemResponseProtocolMock()
      item.id = "id"
      item.title = "title"
      items.append(item)
    }
    response.items = items
    return response
  }
}
