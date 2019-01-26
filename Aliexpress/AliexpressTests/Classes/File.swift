//
//  File.swift
//  AliexpressTests
//
//  Created by Johnson-Richie Louis on 25/01/2019.
//  Copyright © 2019 Johnson-Richie Louis. All rights reserved.
//

import Foundation

public class File {
  
  public static func read(filename: String) -> Data? {
    guard !filename.isEmpty,
      let path = Bundle(for: self).path(forResource: filename, ofType: "json"),
      let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: []) else {
        return nil
    }
    return data
  }
}
