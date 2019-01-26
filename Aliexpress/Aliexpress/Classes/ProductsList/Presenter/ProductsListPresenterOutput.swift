//
//  ProductsListPresenterOutput.swift
//  Aliexpress
//
//  Created by Johnson-Richie Louis on 26/01/2019.
//  Copyright © 2019 Johnson-Richie Louis. All rights reserved.
//

import Foundation

/// sourcery: AutoMockable
protocol ProductsListPresenterOutput: class {
  func reloaData()
  func displayError()
}
