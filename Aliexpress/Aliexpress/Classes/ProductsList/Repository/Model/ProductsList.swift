//
//  ProductsList.swift
//  Aliexpress
//
//  Created by Johnson-Richie Louis on 25/01/2019.
//  Copyright © 2019 Johnson-Richie Louis. All rights reserved.
//

import Foundation

struct ProductsList: Decodable {
  var aggregation: ProductAggregation?
  var items: [ProductItem]?
}
