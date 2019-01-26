//
//  String+ NSLocalizedString.swift
//  Aliexpress
//
//  Created by Johnson-Richie Louis on 26/01/2019.
//  Copyright © 2019 Johnson-Richie Louis. All rights reserved.
//

import Foundation

extension String {
  
  var localized: String {
    return NSLocalizedString(self, tableName: "Aliexpress-localizable", bundle: Bundle.main, value: "", comment: "")
  }
}
