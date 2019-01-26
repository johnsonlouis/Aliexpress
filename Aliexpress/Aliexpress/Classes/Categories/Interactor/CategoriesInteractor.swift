//
//  CategoriesInteractor.swift
//  Aliexpress
//
//  Created by Johnson-Richie Louis on 26/01/2019.
//  Copyright © 2019 Johnson-Richie Louis. All rights reserved.
//

import Foundation

class CategoriesInteractor {
  
  // MARK: Property
  
  private var repository: CategoriesRepositoryInput
  private var storesCategories: [CategoryItem] = []
  weak var output: CategoriesInteractorOutput!
  
  // MARK: - Lifecycle
  
  init(repository: CategoriesRepositoryInput) {
    self.repository = repository
  }
}

// MARK: - CategoriesInteractorInput

extension CategoriesInteractor: CategoriesInteractorInput {
  
  func retrieve() {
    repository.fetch(success: { [weak self] response in
      let categories = response.map { CategoryItem(categoryId: $0.categoryId) }
      self?.storesCategories = categories
      self?.output.didRetrieve(cateogories: categories)
    }, failure: { _ in })
  }
  
  func numberOfCategories() -> Int {
    return (storesCategories.count > 0) ? 1 : 0
  }
  
  func numberOfItems(forCategoryIndex index: Int) -> Int {
    return storesCategories.count
  }
  
  func item(atIndex index: Int, forCategoryIndex categoryIndex: Int) -> CategoryItemProtocol {
    return storesCategories[index]
  }
  
  func selectItem(atIndex index: Int, forCategoryIndex categoryIndex: Int) {
    let item = storesCategories[index]
    output.didSelectItem(item, atIndex: index, forCategoryIndex: categoryIndex)
  }
}

// MARK: - Private Struct

private struct CategoryItem: CategoryItemProtocol {
  var categoryId: Int
}
