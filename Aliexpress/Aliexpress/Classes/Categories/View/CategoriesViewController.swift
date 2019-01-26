//
//  CategoriesViewController.swift
//  Aliexpress
//
//  Created by Johnson-Richie Louis on 26/01/2019.
//  Copyright © 2019 Johnson-Richie Louis. All rights reserved.
//

import UIKit

class CategoriesViewController: UIViewController {
  
  // MARK: - Enum
  private enum Constants {
    static let cellIdentifier = "CategoryTableViewCell"
  }
  
  // MARK: - Property
  
  @IBOutlet weak var tableView: UITableView!
  var presenter: CategoriesPresenterInput!
  
  // MARK: - Lifecycle

  override func viewDidLoad() {
    super.viewDidLoad()
    presenter.viewDidLoad()
  }
}

// MARK: - CategoriesPresenterOutput

extension CategoriesViewController: CategoriesPresenterOutput {
  
  func displayTitle(_ title: String) {
    self.title = title
  }
  
  func reloadData() {
    tableView.reloadData()
  }
}

// MARK: - UITableViewDelegate

extension CategoriesViewController: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    presenter.didSelectRow(atIndexPath: indexPath)
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return UITableView.automaticDimension
  }
}

// MARK: - UITableViewDataSource

extension CategoriesViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return presenter.numberOfRows(inSection: section)
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier, for: indexPath) as? CategoryTableViewCell else {
      return UITableViewCell()
    }
    cell.configure(viewModel: presenter.viewModelForRow(atIndexPath: indexPath))
    return cell
  }
}
