//
//  ProductItemTests.swift
//  AliexpressTests
//
//  Created by Johnson-Richie Louis on 25/01/2019.
//  Copyright © 2019 Johnson-Richie Louis. All rights reserved.
//

import Foundation
import XCTest
import Nimble
@testable import Aliexpress

class ProductItemTests: XCTestCase {
  
  func test_whenDecode_thenSucceed() {
    // Given
    let data = File.read(filename: "product-item-mock")!
    
    // When
    let productItem = try? JSONDecoder().decode(ProductItem.self, from: data)
    
    // Then
    expect(productItem).toNot(beNil())
    expect(productItem).to(beAKindOf(ProductItem.self))
    expect(productItem?.id).to(equal("32708011363"))
    expect(productItem?.title).to(equal("Gold Silver Plated Lion Head Bracelet Men Black Stone Bead Bracelets For Men Punk Jewelry,Stretchy Bracelets Charms Bangle"))
    expect(productItem?.imageUrl).to(equal("https://ae01.alicdn.com/kf/HTB1m8GMLXXXXXcqXFXXq6xXFXXXZ.jpg_960x960.jpg_.webp"))
    expect(productItem?.ratings).to(equal(0))
    expect(productItem?.price).toNot(beNil())
    expect(productItem?.price).to(beAKindOf(ProductPrice.self))
    expect(productItem?.price?.currency).to(equal("USD"))
    expect(productItem?.price?.value).to(equal("1.990"))
  }
}
