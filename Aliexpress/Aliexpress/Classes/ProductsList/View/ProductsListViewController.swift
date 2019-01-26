//
//  ProductsListViewController.swift
//  Aliexpress
//
//  Created by Johnson-Richie Louis on 26/01/2019.
//  Copyright © 2019 Johnson-Richie Louis. All rights reserved.
//

import UIKit

class ProductsListViewController: UIViewController {
  
  // MARK: - IBOutlets
  
  @IBOutlet weak var collectionView: UICollectionView!
  
  // MARK: - Property

  var presenter: ProductsListPresenterInput!
  var imageLoader: ImageLoader!
  
  // MARK: - Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    presenter.viewDidLoad()
    showLoader()
  }
  
  // MARK: - Private
  
  private func hideLoader() {
    UIApplication.shared.isNetworkActivityIndicatorVisible = false
  }
  
  private func showLoader() {
    UIApplication.shared.isNetworkActivityIndicatorVisible = true
  }
}

// MARK: - ProductsListPresenterOutput

extension ProductsListViewController: ProductsListPresenterOutput {
  
  func displayError() {
    hideLoader()
  }
  
  func reloaData() {
    hideLoader()
    collectionView.reloadData()
    collectionView.collectionViewLayout.invalidateLayout()
  }
}

// MARK: - UICollectionViewDelegate

extension ProductsListViewController: UICollectionViewDelegate {
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    presenter.didSelectRow(atIndexPath: indexPath)
  }
  
  func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
    presenter.willDisplayItem(atIndexPath: indexPath)
  }
}

// MARK: - UICollectionViewDataSource

extension ProductsListViewController: UICollectionViewDataSource {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return presenter.numberOfRows(inSection: section)
  }
  
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return presenter.numberOfSections()
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCollectionViewCell", for: indexPath) as? ProductCollectionViewCell else {
      return UICollectionViewCell()
    }
    let viewModel = presenter.viewModelForRow(atIndexPath: indexPath)
    cell.imageLoader = imageLoader
    cell.configure(viewModel: viewModel)
    return cell
  }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension ProductsListViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let padding: CGFloat = 40
    let collectionViewSize = collectionView.frame.size.width - padding
    return CGSize(width: collectionViewSize/2, height: collectionViewSize/2)
  }
}
