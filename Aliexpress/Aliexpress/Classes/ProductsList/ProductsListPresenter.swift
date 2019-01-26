//
//  ProductsListPresenter.swift
//  Aliexpress
//
//  Created by Johnson-Richie Louis on 26/01/2019.
//  Copyright © 2019 Johnson-Richie Louis. All rights reserved.
//

import Foundation

class ProductsListPresenter {
  
  private var router: RouterInput
  private var interactor: ProductsListInteractorInput
  weak var output: ProductsListPresenterOutput!
  
  init(router: RouterInput, interactor: ProductsListInteractorInput) {
    self.router = router
    self.interactor = interactor
  }
}

extension ProductsListPresenter: ProductsListPresenterInput {
  
  func viewDidLoad() {
    interactor.find(for: 139)
  }
  
  func didSelectRow(atIndexPath indexPath: IndexPath) {
  }
  
  func numberOfSections() -> Int {
    return 1
  }
  
  func numberOfRows(inSection section: Int) -> Int {
    return 0
  }
  
  func viewModelForRow(atIndexPath indexPath: IndexPath) -> ProductsListCellViewModelProtocol {
    return ProductsListCellViewModel()
  }
}

extension ProductsListPresenter: ProductsListInteractorOutput {
  
  func didReceive() {
  }
}

protocol ProductsListPresenterInput {
  func viewDidLoad()
  func didSelectRow(atIndexPath indexPath: IndexPath)
  func numberOfSections() -> Int
  func numberOfRows(inSection section: Int) -> Int
  func viewModelForRow(atIndexPath indexPath: IndexPath) -> ProductsListCellViewModelProtocol
}

protocol ProductsListCellViewModelProtocol {
}

protocol ProductsListPresenterOutput: class {
}

private struct ProductsListCellViewModel: ProductsListCellViewModelProtocol {
}
