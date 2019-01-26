//
//  RouterInput.swift
//  Aliexpress
//
//  Created by Johnson-Richie Louis on 26/01/2019.
//  Copyright © 2019 Johnson-Richie Louis. All rights reserved.
//

import UIKit

/// sourcery: AutoMockable
protocol RouterInput {
  func initialViewController() -> UIViewController
  func routeToProductsList(with categoryId: Int)
}
