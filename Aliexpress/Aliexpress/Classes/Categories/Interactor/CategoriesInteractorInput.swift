//
//  CategoriesInteractorInput.swift
//  Aliexpress
//
//  Created by Johnson-Richie Louis on 26/01/2019.
//  Copyright © 2019 Johnson-Richie Louis. All rights reserved.
//

import Foundation

/// sourcery: AutoMockable
protocol CategoriesInteractorInput {
  func retrieve()
  func numberOfCategories() -> Int
  func numberOfItems(forCategoryIndex index: Int) -> Int
  func item(atIndex index: Int, forCategoryIndex categoryIndex: Int) -> CategoryItemProtocol
  func selectItem(atIndex index: Int, forCategoryIndex categoryIndex: Int)
}
