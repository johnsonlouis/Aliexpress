//
//  CategoriesPresenter.swift
//  Aliexpress
//
//  Created by Johnson-Richie Louis on 26/01/2019.
//  Copyright © 2019 Johnson-Richie Louis. All rights reserved.
//

import Foundation

class CategoriesPresenter {
  
  // MARK: - Property
  
  private var router: RouterInput
  private var interactor: CategoriesInteractorInput
  weak var output: CategoriesPresenterOutput!
  
  // MARK: - Lifecycle

  init(router: RouterInput, interactor: CategoriesInteractorInput) {
    self.router = router
    self.interactor = interactor
  }
}

// MARK: - CategoriesPresenterInput

extension CategoriesPresenter: CategoriesPresenterInput {
  
  func viewDidLoad() {
    interactor.retrieve()
  }
  
  func didSelectRow(atIndexPath indexPath: IndexPath) {
    interactor.selectItem(atIndex: indexPath.item, forCategoryIndex: indexPath.section)
  }
  
  func numberOfSections() -> Int {
    return interactor.numberOfCategories()
  }
  
  func numberOfRows(inSection section: Int) -> Int {
    return interactor.numberOfItems(forCategoryIndex: section)
  }
  
  func viewModelForRow(atIndexPath indexPath: IndexPath) -> CategoryCellViewModelProtocol {
    return CategoryCellViewModel(title: "Categorie \(indexPath.row + 1)")
  }
}

extension CategoriesPresenter: CategoriesInteractorOutput {
  
  func didRetrieve(cateogories: [CategoryItemProtocol]) {
    output.reloadData()
  }
  
  func didSelectItem(_ item: CategoryItemProtocol, atIndex index: Int, forCategoryIndex categoryIndex: Int) {
    router.routeToProductsList(with: item.categoryId)
  }
}

private struct CategoryCellViewModel: CategoryCellViewModelProtocol {
  var title: String
}
