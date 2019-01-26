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
  
  private func splashViewController() -> UIViewController {
    let apiConnector = AliexpressApiConnector()
    let repository = ProductsListRepository(apiConnector: apiConnector)
    let interactor = ProductsListInteractor(repository: repository)
    let presenter = ProductsListPresenter(router: self, interactor: interactor)
    interactor.output = presenter
    let viewController = StoryboardScene.Main.splashViewController.instantiate()
    presenter.output = viewController
    viewController.presenter = presenter
    return categoryViewController()
  }
  
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
    let interactor = ProductsListInteractor(repository: repository)
    let presenter = ProductsListPresenter(router: self, interactor: interactor)
    interactor.output = presenter
    let viewController = StoryboardScene.Main.splashViewController.instantiate()
    presenter.output = viewController
    viewController.presenter = presenter
    return viewController
  }
}

extension Router: RouterInput {
  
  func initialViewController() -> UIViewController {
    navigationController.setViewControllers([splashViewController()], animated: false)
    return navigationController
  }
  
  func routeToProductsList(with categoryId: Int) {
    let productsListViewController = self.productsListViewController(with: categoryId)
    navigationController.pushViewController(productsListViewController, animated: true)
  }
}

protocol RouterInput {
  func initialViewController() -> UIViewController
  func routeToProductsList(with categoryId: Int)
}
