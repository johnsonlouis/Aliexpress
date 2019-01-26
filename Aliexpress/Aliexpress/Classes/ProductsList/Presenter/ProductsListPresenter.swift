//
//  ProductsListPresenter.swift
//  Aliexpress
//
//  Created by Johnson-Richie Louis on 26/01/2019.
//  Copyright © 2019 Johnson-Richie Louis. All rights reserved.
//

import Foundation

class ProductsListPresenter {
  
  // MARK: - Property

  private var router: RouterInput
  private var interactor: ProductsListInteractorInput
  weak var output: ProductsListPresenterOutput!
  
  // MARK: - Lifecycle

  init(router: RouterInput, interactor: ProductsListInteractorInput) {
    self.router = router
    self.interactor = interactor
  }
}

// MARK: - ProductsListPresenterInput

extension ProductsListPresenter: ProductsListPresenterInput {
  
  func willDisplayItem(atIndexPath indexPath: IndexPath) {
    interactor.retrieve(atIndex: indexPath.item, forCategoryIndex: indexPath.section)
  }
  
  func viewDidLoad() {
    interactor.retrieve()
    output.displayTitle(L10n.ProductsList.title)
  }
  
  func didSelectRow(atIndexPath indexPath: IndexPath) {
    interactor.selectItem(atIndex: indexPath.item, forCategoryIndex: indexPath.section)
  }
  
  func numberOfSections() -> Int {
    return 1
  }
  
  func numberOfRows(inSection section: Int) -> Int {
    return interactor.numberOfItems(forCategoryIndex: section)
  }
  
  func viewModelForRow(atIndexPath indexPath: IndexPath) -> ProductsListCellViewModelProtocol {
    let item = interactor.item(atIndex: indexPath.row, forCategoryIndex: indexPath.section)
    var priceString: String? = nil
    if let price = item.price, let currency = price.currency, let value = price.value {
      priceString = "\(value) \(currency)"
    }
    return ProductsListCellViewModel(imageUrl: item.imageUrl,
                                     title: item.title,
                                     price: priceString)
  }
}

// MARK: - ProductsListInteractorOutput

extension ProductsListPresenter: ProductsListInteractorOutput {
  
  func didReceiveNext() {
    output.reloaData()
  }
  
  func didReceiveError() {
    output.displayError(L10n.Tehnical.Error.message)
  }
  
  func didReceive() {
    output.reloaData()
  }
}

// MARK: - ProductsListCellViewModelProtocol

private struct ProductsListCellViewModel: ProductsListCellViewModelProtocol {
  var imageUrl: String?
  var title: String
  var price: String?
}
