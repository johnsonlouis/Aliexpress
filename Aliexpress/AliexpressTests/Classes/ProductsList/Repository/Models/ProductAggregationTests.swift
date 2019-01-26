//
//  ProductAggregationTests.swift
//  AliexpressTests
//
//  Created by Johnson-Richie Louis on 25/01/2019.
//  Copyright © 2019 Johnson-Richie Louis. All rights reserved.
//

import Foundation
import XCTest
import Nimble
@testable import Aliexpress

class ProductAggregationTests: XCTestCase {
  
  func test_whenDecode_thenSucceed() {
    // Given
    let data = File.read(filename: "product-aggregation-mock")!
    
    // When
    let aggregation = try? JSONDecoder().decode(ProductAggregation.self, from: data)
    
    // Then
    expect(aggregation).toNot(beNil())
    expect(aggregation).to(beAKindOf(ProductAggregation.self))
    expect(aggregation?.totalCount).to(equal(302672))
    expect(aggregation?.skip).to(equal(0))
    expect(aggregation?.limit).to(equal(25))
    expect(aggregation?.scrollIdentifier).to(equal("DnF1ZXJ5VGhlbkZldGNoBQAAAAAAAAQ6FkV"))
  }
}
