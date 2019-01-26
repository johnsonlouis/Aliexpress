//
//  ProductPriceTests.swift
//  AliexpressTests
//
//  Created by Johnson-Richie Louis on 25/01/2019.
//  Copyright © 2019 Johnson-Richie Louis. All rights reserved.
//

import Foundation
import XCTest
import Nimble
@testable import Aliexpress

class ProductPriceTests: XCTestCase {
  
  func test_whenDecode_thenSucceed() {
    // Given
    let data = File.read(filename: "product-price-mock")!
    
    // When
    let price = try? JSONDecoder().decode(ProductPrice.self, from: data)
    
    // Then
    expect(price).toNot(beNil())
    expect(price).to(beAKindOf(ProductPrice.self))
    expect(price?.currency).to(equal("USD"))
    expect(price?.value).to(equal("1.990"))
  }
}
