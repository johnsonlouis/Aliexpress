// Generated using Sourcery 0.15.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT


// swiftlint:disable all
// swiftlint:disable vertical_whitespace

import Foundation
#if os(iOS) || os(tvOS) || os(watchOS)
import UIKit
import CoreLocation
import LocalAuthentication
#elseif os(OSX)
import AppKit
#endif

@testable import Aliexpress













class ApiConnectorMock: ApiConnector {

    // MARK: - request

    var requestWithSuccessFailureCallsCount = 0
    var requestWithSuccessFailureCalledOnQueueLabel: String?
    var requestWithSuccessFailureCalled: Bool {
        return requestWithSuccessFailureCallsCount > 0
    }
    var requestWithSuccessFailureReceivedArguments: (request: ApiRequestProtocol, success: (ApiResponseProtocol) -> Void, failure: (ApiError) -> Void)?
    var requestWithSuccessFailureClosure: ((ApiRequestProtocol, @escaping (ApiResponseProtocol) -> Void, @escaping (ApiError) -> Void) -> Void)?

    func request(with request: ApiRequestProtocol,               success: @escaping (ApiResponseProtocol) -> Void,               failure: @escaping (ApiError) -> Void) {
        requestWithSuccessFailureCallsCount += 1
        requestWithSuccessFailureCalledOnQueueLabel = String(cString: __dispatch_queue_get_label(nil))
        requestWithSuccessFailureReceivedArguments = (request: request, success: success, failure: failure)
        requestWithSuccessFailureClosure?(request, success, failure)
    }

}
class ApiRequestProtocolMock: ApiRequestProtocol {
    var endpoint: String {
        get { return underlyingEndpoint }
        set(value) { underlyingEndpoint = value }
    }
    var underlyingEndpoint: String!
    var method: ApiMethod {
        get { return underlyingMethod }
        set(value) { underlyingMethod = value }
    }
    var underlyingMethod: ApiMethod!
    var parameters: [String: Any]?
    var headers: [String: Any]?

}
class ApiResponseProtocolMock: ApiResponseProtocol {
    var data: Data {
        get { return underlyingData }
        set(value) { underlyingData = value }
    }
    var underlyingData: Data!
    var statusCode: Int {
        get { return underlyingStatusCode }
        set(value) { underlyingStatusCode = value }
    }
    var underlyingStatusCode: Int!

}
class CategoriesRepositoryInputMock: CategoriesRepositoryInput {

    // MARK: - fetch

    var fetchSuccessFailureCallsCount = 0
    var fetchSuccessFailureCalledOnQueueLabel: String?
    var fetchSuccessFailureCalled: Bool {
        return fetchSuccessFailureCallsCount > 0
    }
    var fetchSuccessFailureReceivedArguments: (success: (CategoriesRepositoryResponseProtocol) -> Void, failure: (CategoriesRepositoryError) -> Void)?
    var fetchSuccessFailureClosure: ((@escaping (CategoriesRepositoryResponseProtocol) -> Void, @escaping (CategoriesRepositoryError) -> Void) -> Void)?

    func fetch(success: @escaping (CategoriesRepositoryResponseProtocol) -> Void, failure: @escaping (CategoriesRepositoryError) -> Void) {
        fetchSuccessFailureCallsCount += 1
        fetchSuccessFailureCalledOnQueueLabel = String(cString: __dispatch_queue_get_label(nil))
        fetchSuccessFailureReceivedArguments = (success: success, failure: failure)
        fetchSuccessFailureClosure?(success, failure)
    }

}
class CategoriesRepositoryResponseProtocolMock: CategoriesRepositoryResponseProtocol {

}
class CategoryRepositoryInputMock: CategoryRepositoryInput {

}
class ProductsListRepositoryInputMock: ProductsListRepositoryInput {

    // MARK: - fetch

    var fetchWithSuccessFailureCallsCount = 0
    var fetchWithSuccessFailureCalledOnQueueLabel: String?
    var fetchWithSuccessFailureCalled: Bool {
        return fetchWithSuccessFailureCallsCount > 0
    }
    var fetchWithSuccessFailureReceivedArguments: (parameters: ProductsListRepositoryParameters, success: (ProductsListRepositoryResponseProtocol) -> Void, failure: (ProductsListRepositoryError) -> Void)?
    var fetchWithSuccessFailureClosure: ((ProductsListRepositoryParameters, @escaping (ProductsListRepositoryResponseProtocol) -> Void, @escaping (ProductsListRepositoryError) -> Void) -> Void)?

    func fetch(with parameters: ProductsListRepositoryParameters,             success: @escaping (ProductsListRepositoryResponseProtocol) -> Void,             failure: @escaping (ProductsListRepositoryError) -> Void) {
        fetchWithSuccessFailureCallsCount += 1
        fetchWithSuccessFailureCalledOnQueueLabel = String(cString: __dispatch_queue_get_label(nil))
        fetchWithSuccessFailureReceivedArguments = (parameters: parameters, success: success, failure: failure)
        fetchWithSuccessFailureClosure?(parameters, success, failure)
    }

}
class ProductsListRepositoryParametersMock: ProductsListRepositoryParameters {
    var text: String?
    var sort: String?
    var currency: String?
    var category: Int?
    var skip: Int?
    var limit: Int?
    var scrollPagination: Bool?
    var sortDirection: String?

}
class ProductsListRepositoryProductAggregationResponseProtocolMock: ProductsListRepositoryProductAggregationResponseProtocol {
    var totalCount: Int?
    var skip: Int?
    var limit: Int?
    var scrollIdentifier: String?

}
class ProductsListRepositoryProductItemResponseProtocolMock: ProductsListRepositoryProductItemResponseProtocol {
    var id: String?
    var title: String?
    var imageUrl: String?
    var ratings: Float?
    var price: ProductsListRepositoryProductPriceResponseProtocol?

}
class ProductsListRepositoryProductPriceResponseProtocolMock: ProductsListRepositoryProductPriceResponseProtocol {
    var currency: String?
    var value: String?

}
class ProductsListRepositoryResponseProtocolMock: ProductsListRepositoryResponseProtocol {
    var aggregation: ProductsListRepositoryProductAggregationResponseProtocol?
    var items: [ProductsListRepositoryProductItemResponseProtocol]?

}
