//
//  ProductCollectionViewCell.swift
//  Aliexpress
//
//  Created by Johnson-Richie Louis on 26/01/2019.
//  Copyright © 2019 Johnson-Richie Louis. All rights reserved.
//

import UIKit

@IBDesignable
class ProductCollectionViewCell: UICollectionViewCell {

    @IBInspectable
    public var cornerRadius: CGFloat = 0.0 {
        didSet {
            self.layer.cornerRadius = self.cornerRadius
        }
    }

    @IBInspectable
    public var borderColor: UIColor = .clear {
        didSet {
            self.layer.borderColor = self.borderColor.cgColor
        }
    }

    @IBInspectable
    public var borderWidth: CGFloat = 0 {
        didSet {
            self.layer.borderWidth = self.borderWidth
        }
    }

    // MARK: - IBOutlet

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!

    // MARK: - Public

    func configure(viewModel: ProductsListCellViewModelProtocol) {
        priceLabel.text = viewModel.price
        titleLabel.text = viewModel.title
        guard let imageUrl = viewModel.imageUrl,
            let url = URL(string: imageUrl) else {
                loadImage(imageUrl: nil)
                return
        }
        loadImage(imageUrl: url)
    }

    // MARK: - Private

    private func loadImage(imageUrl: URL?) {
        imageView.load(url: imageUrl,
                       placeholder: Asset.placeholder.image,
                       animated: true) { [weak self] in
                        self?.setNeedsLayout()
        }
    }
}
