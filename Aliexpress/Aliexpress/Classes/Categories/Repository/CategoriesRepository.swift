//
//  CategoriesRepository.swift
//  Aliexpress
//
//  Created by Johnson-Richie Louis on 25/01/2019.
//  Copyright © 2019 Johnson-Richie Louis. All rights reserved.
//

import Foundation

enum Categories: Int, CaseIterable {
  case apparelForMen = 100003070
  case apparelForWomen = 100003109
  case automobilesMotorcycles = 34
  case beautyHealth = 66
  case cellphonesTelecommunications = 509
  case computerOffice = 7
  case consumerElectronics = 44
  case electronicComponentsSupplies = 502
  case furniture = 1503
  case hairExtensionsWigs = 200002489
  case homeGarden = 15
  case homeImprovement = 13
  case jewelryAccessories = 1509
  case luggageBags = 1524
  case motherKids = 1501
  case noveltySpecialUse = 200000875
  case officeSchool = 21
  case securityProtection = 30
  case Shoes = 322
  case sportsEntertainment = 18
  case tools = 1420
  case toysHobbies = 26
  case watches = 1511
  case weddingsEvents = 100003235
  case video360CamerasAccessories = 200216592
}

class CategoriesRepository {
}

// MARK: - CategoriesRepositoryInput

extension CategoriesRepository: CategoriesRepositoryInput {
  func fetch(success: @escaping ([CategoriesRepositoryResponseProtocol]) -> Void, failure: @escaping (CategoriesRepositoryError) -> Void) {
    let categories = Categories.allCases.map { CategoriesRepositoryResponse(categoryId: $0.rawValue) }
    success(categories)
  }
}

// MARK: - Private struct

private struct CategoriesRepositoryResponse: CategoriesRepositoryResponseProtocol {
  var categoryId: Int
}
