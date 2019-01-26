//
//  ProductCollectionViewCell.swift
//  Aliexpress
//
//  Created by Johnson-Richie Louis on 26/01/2019.
//  Copyright © 2019 Johnson-Richie Louis. All rights reserved.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {
  
  // MARK: - Outlet
  
  @IBOutlet weak var imageView: UIImageView!
  
  // MARK: - Property
  
  var imageLoader: ImageLoader!
  
  // MARK: - Public
  
  func configure(viewModel: ProductsListCellViewModelProtocol) {
    guard let imageUrl = viewModel.imageUrl,
      let url = URL(string: imageUrl) else {
        loadImage(imageUrl: nil)
        return
    }
    loadImage(imageUrl: url)
  }
  
  private func loadImage(imageUrl: URL?) {
    imageLoader.loadImage(imageView: imageView,
                          url: imageUrl,
                          placeholder: Asset.placeholder.image,
                          animated: true,
                          completionHandler: { [weak self] in
                            self?.setNeedsLayout()}
    )
  }
}
