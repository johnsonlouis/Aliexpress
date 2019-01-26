//
//  ProductItem.swift
//  Aliexpress
//
//  Created by Johnson-Richie Louis on 25/01/2019.
//  Copyright © 2019 Johnson-Richie Louis. All rights reserved.
//

import Foundation

struct ProductItem: Decodable {
  var id: String?
  var title: String?
  var imageUrl: String?
  var ratings: Float?
  var price: ProductPrice?
}

