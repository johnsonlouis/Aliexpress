//
//  CategoriesRepositoryInput.swift
//  Aliexpress
//
//  Created by Johnson-Richie Louis on 25/01/2019.
//  Copyright © 2019 Johnson-Richie Louis. All rights reserved.
//

import Foundation

/// sourcery: AutoMockable
protocol CategoriesRepositoryInput {
  func fetch(success: @escaping ([CategoriesRepositoryResponseProtocol]) -> Void, failure: @escaping (CategoriesRepositoryError) -> Void)
}
