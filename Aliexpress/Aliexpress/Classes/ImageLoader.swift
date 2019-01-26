//
//  ImageLoader.swift
//  Aliexpress
//
//  Created by Johnson-Richie Louis on 26/01/2019.
//  Copyright © 2019 Johnson-Richie Louis. All rights reserved.
//

import UIKit

public protocol ImageLoader {
  func loadImage(imageView: UIImageView, url: URL?, placeholder: UIImage?, animated: Bool, completionHandler: @escaping () -> Void?)
}

public extension ImageLoader {
  
  public func loadImage(imageView: UIImageView, url: URL?, placeholder: UIImage?, completionHandler: @escaping () -> Void) {
    loadImage(imageView: imageView, url: url, placeholder: placeholder, animated: false, completionHandler: completionHandler)
  }
}
