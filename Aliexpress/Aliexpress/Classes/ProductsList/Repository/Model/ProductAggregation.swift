//
//  ProductAggregation.swift
//  Aliexpress
//
//  Created by Johnson-Richie Louis on 25/01/2019.
//  Copyright © 2019 Johnson-Richie Louis. All rights reserved.
//

import Foundation

struct ProductAggregation: Decodable {
  var totalCount: Int?
  var skip: Int?
  var limit: Int?
  var scrollIdentifier: String?
}
