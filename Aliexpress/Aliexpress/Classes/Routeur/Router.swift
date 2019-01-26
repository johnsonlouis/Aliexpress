//
//  Router.swift
//  Aliexpress
//
//  Created by Johnson-Richie Louis on 26/01/2019.
//  Copyright © 2019 Johnson-Richie Louis. All rights reserved.
//

import UIKit

class Router {
  
  private var navigationController = UINavigationController()
  private var imageLoader = AliexpressImageLoader()
  
  func categoryViewController() -> UIViewController  {
    let repository = CategoriesRepository()
    let interactor = CategoriesInteractor(repository: repository)
    let presenter = CategoriesPresenter(router: self, interactor: interactor)
    interactor.output = presenter
    let viewController = StoryboardScene.Main.productsCategoryViewController.instantiate()
    presenter.output = viewController
    viewController.presenter = presenter
    return viewController
  }
  
  func productsListViewController(with categoryId: Int) -> UIViewController{
    let apiConnector = AliexpressApiConnector()
    let repository = ProductsListRepository(apiConnector: apiConnector)
    let interactor = ProductsListInteractor(repository: repository, categoryId: categoryId)
    let presenter = ProductsListPresenter(router: self, interactor: interactor)
    interactor.output = presenter
    let viewController = StoryboardScene.Main.productsListViewController.instantiate()
    presenter.output = viewController
    viewController.presenter = presenter
    viewController.imageLoader = imageLoader
    return viewController
  }
}

extension Router: RouterInput {
  
  func initialViewController() -> UIViewController {
    navigationController.setViewControllers([categoryViewController()], animated: false)
    return navigationController
  }
  
  func routeToProductsList(with categoryId: Int) {
    let productsListViewController = self.productsListViewController(with: categoryId)
    navigationController.pushViewController(productsListViewController, animated: true)
  }
}
