//
//  ProductsListPresenterInput.swift
//  Aliexpress
//
//  Created by Johnson-Richie Louis on 26/01/2019.
//  Copyright © 2019 Johnson-Richie Louis. All rights reserved.
//

import Foundation

/// sourcery: AutoMockable
protocol ProductsListPresenterInput {
  func viewDidLoad()
  func didSelectRow(atIndexPath indexPath: IndexPath)
  func numberOfSections() -> Int
  func numberOfRows(inSection section: Int) -> Int
  func viewModelForRow(atIndexPath indexPath: IndexPath) -> ProductsListCellViewModelProtocol
  func willDisplayItem(atIndexPath indexPath: IndexPath)
}

/// sourcery: AutoMockable
protocol ProductsListCellViewModelProtocol {
  var imageUrl: String? { get }
  var title: String { get }
  var price: String? { get } 
}
