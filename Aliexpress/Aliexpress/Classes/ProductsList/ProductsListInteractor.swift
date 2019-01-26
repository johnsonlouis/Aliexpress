//
//  ProductsListInteractor.swift
//  Aliexpress
//
//  Created by Johnson-Richie Louis on 26/01/2019.
//  Copyright © 2019 Johnson-Richie Louis. All rights reserved.
//

import Foundation

class ProductsListInteractor {
  
  // MARK: Property
  
  private var repository: ProductsListRepositoryInput
  weak var output: ProductsListInteractorOutput!
  
  // MARK: Lifecycle

  init(repository: ProductsListRepositoryInput) {
    self.repository = repository
  }
}

extension ProductsListInteractor: ProductsListInteractorInput {
  
  func find(for category: Int) {
  }
}

protocol ProductsListInteractorInput {
  func find(for category: Int)
}

protocol ProductsListInteractorOutput: class {
  func didReceive()
}

// MARK: Private

private struct ProductsListRepositoryParameters: ProductsListRepositoryParametersProtocol {
  var text: String?
  var sort: String?
  var currency: String?
  var category: Int?
  var skip: Int?
  var limit: Int?
  var scrollPagination: Bool?
  var sortDirection: String?
}
