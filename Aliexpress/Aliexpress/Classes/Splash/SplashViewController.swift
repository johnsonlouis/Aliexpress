//
//  SplashViewController.swift
//  Aliexpress
//
//  Created by Johnson-Richie Louis on 25/01/2019.
//  Copyright © 2019 Johnson-Richie Louis. All rights reserved.
//

import UIKit
import Alamofire

class SplashViewController: UIViewController {
  
  var presenter: ProductsListPresenterInput!
  
  //MARK: - Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    presenter.viewDidLoad()
    
    let apiConnector = AliexpressApiConnector()
    let repository = ProductsListRepository(apiConnector: apiConnector)
    let parameters = ProductsListRepositoryParameters(text: nil,
                                                      sort: "BEST_MATCH",
                                                      currency: "EUR",
                                                      category: 100003070,
                                                      skip: nil,
                                                      limit: nil,
                                                      scrollPagination: true,
                                                      sortDirection: nil)
    repository.fetch(with: parameters, success: { response in
      debugPrint(response)
    }, failure: { error in
      debugPrint(error)
    })
  }
}

extension SplashViewController: ProductsListPresenterOutput {
}

private struct ProductsListRepositoryParameters: ProductsListRepositoryParametersProtocol {
  var text: String?
  var sort: String?
  var currency: String?
  var category: Int?
  var skip: Int?
  var limit: Int?
  var scrollPagination: Bool?
  var sortDirection: String?
}
