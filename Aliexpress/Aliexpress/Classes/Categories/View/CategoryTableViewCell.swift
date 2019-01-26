//
//  CategoryTableViewCell.swift
//  Aliexpress
//
//  Created by Johnson-Richie Louis on 26/01/2019.
//  Copyright © 2019 Johnson-Richie Louis. All rights reserved.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {
  
  // MARK: - Outlets
  
  @IBOutlet weak var titleLabel: UILabel!
  
  // MARK: - Lifecycle

  override init (style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
  }
  
  required init(coder decoder: NSCoder) {
    super.init(coder: decoder)!
  }
  
  // MARK: - Public
  
  func configure(viewModel: CategoryCellViewModelProtocol) {
    titleLabel?.text = viewModel.title
  }
}
