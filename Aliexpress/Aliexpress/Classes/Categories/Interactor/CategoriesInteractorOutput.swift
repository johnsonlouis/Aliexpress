//
//  CategoriesInteractorOutput.swift
//  Aliexpress
//
//  Created by Johnson-Richie Louis on 26/01/2019.
//  Copyright © 2019 Johnson-Richie Louis. All rights reserved.
//

import Foundation

protocol CategoriesInteractorOutput: class {
  func didRetrieve(cateogories: [CategoryItemProtocol])
  func didSelectItem(_ item: CategoryItemProtocol, atIndex index: Int, forCategoryIndex categoryIndex: Int)
}

protocol CategoryItemProtocol {
  var categoryId: Int { get }
}
