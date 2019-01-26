//
//  CategoriesRepositoryTests.swift
//  AliexpressTests
//
//  Created by Johnson-Richie Louis on 25/01/2019.
//  Copyright © 2019 Johnson-Richie Louis. All rights reserved.
//

import Foundation
import XCTest
import Nimble
@testable import Aliexpress

class CategoriesRepositoryTests: XCTestCase {
  
  private var repository: CategoriesRepository!
  
  override func setUp() {
    super.setUp()
    repository = CategoriesRepository()
  }
  
  override func tearDown() {
    repository = nil
    super.tearDown()
  }
}
