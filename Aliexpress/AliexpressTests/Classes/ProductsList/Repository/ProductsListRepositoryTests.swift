//
//  ProductsListRepository.swift
//  AliexpressTests
//
//  Created by Johnson-Richie Louis on 26/01/2019.
//  Copyright © 2019 Johnson-Richie Louis. All rights reserved.
//

import Foundation
import XCTest
import Nimble
@testable import Aliexpress

class ProductsListRepositoryTests: XCTestCase {
  
  private var repository: ProductsListRepository!
  private var apiConnector: ApiConnectorMock!
  
  override func setUp() {
    super.setUp()
    apiConnector = ApiConnectorMock()
    repository = ProductsListRepository(apiConnector: apiConnector)
  }
  
  override func tearDown() {
    repository = nil
    apiConnector = nil
    super.tearDown()
  }
  
  func test_whenFetch_thenRequestWithSuccessFailureCalled() {
    // Given
    let parameters = ProductsListRepositoryParametersMock()
    
    // When
    repository.fetch(with: parameters, success: { _ in }, failure: { _ in })
    
    // Then
    expect(self.apiConnector.requestWithSuccessFailureCallsCount).to(equal(1))
  }
  
  func test_whenFetch_thenFailureWithForbiddenError() {
    // Given
    apiConnector.requestWithSuccessFailureClosure = { _, _, failure in
      failure(.forbidden)
    }
    
    let parameters = ProductsListRepositoryParametersMock()
    
    // When
    var expectedValue: ProductsListRepositoryError?
    repository.fetch(with: parameters, success: { _ in }, failure: { error in
      expectedValue = error
    })
    
    // Then
    expect(expectedValue).toEventually(equal(.forbidden))
  }
  
  func test_whenFetch_thenFailureWithBodyRequestError() {
    // Given
    apiConnector.requestWithSuccessFailureClosure = { _, _, failure in
      failure(.requestBody)
    }
    
    let parameters = ProductsListRepositoryParametersMock()
    
    // When
    var expectedValue: ProductsListRepositoryError?
    repository.fetch(with: parameters, success: { _ in }, failure: { error in
      expectedValue = error
    })
    
    // Then
    expect(expectedValue).toEventually(equal(.requestBody))
  }
  
  func test_whenFetch_thenFailureWithAllowableCallCountError() {
    // Given
    apiConnector.requestWithSuccessFailureClosure = { _, _, failure in
      failure(.allowableCallCount)
    }
    
    let parameters = ProductsListRepositoryParametersMock()
    
    // When
    var expectedValue: ProductsListRepositoryError?
    repository.fetch(with: parameters, success: { _ in }, failure: { error in
      expectedValue = error
    })
    
    // Then
    expect(expectedValue).toEventually(equal(.allowableCallCount))
  }
  
  func test_whenFetch_thenFailureWithServerError() {
    // Given
    apiConnector.requestWithSuccessFailureClosure = { _, _, failure in
      failure(.server)
    }
    
    let parameters = ProductsListRepositoryParametersMock()
    
    // When
    var expectedValue: ProductsListRepositoryError?
    repository.fetch(with: parameters, success: { _ in }, failure: { error in
      expectedValue = error
    })
    
    // Then
    expect(expectedValue).to(equal(.server))
  }
  
  func test_whenFetch_thenFailureWithTechnicalError() {
    // Given
    apiConnector.requestWithSuccessFailureClosure = { _, _, failure in
      failure(.other(666))
    }
    
    let parameters = ProductsListRepositoryParametersMock()
    
    // When
    var expectedValue: ProductsListRepositoryError?
    repository.fetch(with: parameters, success: { _ in }, failure: { error in
      expectedValue = error
    })
    
    // Then
    expect(expectedValue).toEventually(equal(.technical))
  }
  
  func test_whenFetchAndFailedToDecodeData_thenFailureWithTechnicalError() {
    // Given
    // Given
    let response = ApiResponseProtocolMock()
    response.data = File.read(filename: "error-mock")!
    
    let parameters = ProductsListRepositoryParametersMock()
    
    apiConnector.requestWithSuccessFailureClosure = { _, success, _ in
      success(response)
    }
    
    // When
    var expectedValue: ProductsListRepositoryError?
    repository.fetch(with: parameters, success: { _ in }, failure: { error in
      expectedValue = error
    })
    
    // Then
    expect(expectedValue).toEventually(equal(.technical))
  }
  
  func test_whenFetch_thenSucceed() {
    // Given
    let response = ApiResponseProtocolMock()
    response.data = File.read(filename: "products-list-mock")!
    
    let parameters = ProductsListRepositoryParametersMock()

    apiConnector.requestWithSuccessFailureClosure = { _, success, _ in
      success(response)
    }
    
    // When
    var expectedValue: ProductsListRepositoryResponseProtocol?
    repository.fetch(with: parameters, success: { response in
      expectedValue = response
    }, failure: { _ in })
    
    // Then
    expect(expectedValue).toNot(beNil())
    expect(expectedValue).to(beAKindOf(ProductsListRepositoryResponseProtocol.self))
    expect(expectedValue?.items).to(beAKindOf(Array<ProductsListRepositoryProductItemResponseProtocol>.self))
    expect(expectedValue?.items?.count).to(equal(25))
    
    let aggregation = expectedValue?.aggregation
    expect(aggregation).toNot(beNil())
    expect(aggregation).to(beAKindOf(ProductsListRepositoryProductAggregationResponseProtocol.self))
    expect(aggregation?.totalCount).to(equal(302672))
    expect(aggregation?.skip).to(equal(0))
    expect(aggregation?.limit).to(equal(25))
    expect(aggregation?.scrollIdentifier).to(equal("DnF1ZXJ5VGhlbkZldGNoBQAAAAAAAAQ6FkV"))
    
    let productItem = expectedValue?.items?.first
    expect(productItem).toNot(beNil())
    expect(productItem).to(beAKindOf(ProductsListRepositoryProductItemResponseProtocol.self))
    expect(productItem?.id).to(equal("32708011363"))
    expect(productItem?.title).to(equal("Gold Silver Plated Lion Head Bracelet Men Black Stone Bead Bracelets For Men Punk Jewelry,Stretchy Bracelets Charms Bangle"))
    expect(productItem?.imageUrl).to(equal("https://ae01.alicdn.com/kf/HTB1m8GMLXXXXXcqXFXXq6xXFXXXZ.jpg_960x960.jpg_.webp"))
    expect(productItem?.ratings).to(equal(0))
    expect(productItem?.price).toNot(beNil())
    expect(productItem?.price).to(beAKindOf(ProductsListRepositoryProductPriceResponseProtocol.self))
    expect(productItem?.price?.currency).to(equal("USD"))
    expect(productItem?.price?.value).to(equal("1.990"))
  }
  
  func test_whenFetch_thenSucceefd() {
    // Given
    let response = ApiResponseProtocolMock()
    response.data = File.read(filename: "products-list-mock")!
    
    let parameters = ProductsListRepositoryParametersMock()
    parameters.text = "An apple"
    parameters.sort = "A sort"
    parameters.currency = "USD"
    parameters.category = 1989
    parameters.skip = 20
    parameters.limit = 25
    parameters.scrollPagination = true
    parameters.sortDirection = "direction"
    
    apiConnector.requestWithSuccessFailureClosure = { _, success, _ in
      success(response)
    }
    
    // When
    repository.fetch(with: parameters, success: { _ in }, failure: { _ in })

    // Then
    let request = self.apiConnector.requestWithSuccessFailureReceivedArguments!.request
    expect(request).toNot(beNil())
    expect(request.endpoint).to(equal("https://api.aliseeks.com/v1/search"))
    expect(request.method).to(equal(.post))
    expect(request.headers).toNot(beNil())
    expect(request.parameters).toNot(beNil())
  }
}
