//
//  AliexpressImageLoader.swift
//  Aliexpress
//
//  Created by Johnson-Richie Louis on 26/01/2019.
//  Copyright © 2019 Johnson-Richie Louis. All rights reserved.
//

import Foundation
import Kingfisher

public final class AliexpressImageLoader {}

extension AliexpressImageLoader: ImageLoader {
  
  public func loadImage(imageView: UIImageView, url: URL?, placeholder: UIImage?, animated: Bool, completionHandler: @escaping () -> Void?) {
    let options: KingfisherOptionsInfo? = animated ? [.transition(ImageTransition.fade(1))] : nil
    imageView.kf.setImage(with: url, placeholder: placeholder, options: options) { _ in
      completionHandler()
    }
  }
}
