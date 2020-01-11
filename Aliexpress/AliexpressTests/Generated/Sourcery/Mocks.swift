// Generated using Sourcery 0.17.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT


// swiftlint:disable line_length
// swiftlint:disable variable_name

import Foundation
#if os(iOS) || os(tvOS) || os(watchOS)
import UIKit
#elseif os(OSX)
import AppKit
#endif

@testable import Aliexpress














class ApiConnectorMock: ApiConnector {

    //MARK: - request

    var requestWithSuccessFailureCallsCount = 0
    var requestWithSuccessFailureCalled: Bool {
        return requestWithSuccessFailureCallsCount > 0
    }
    var requestWithSuccessFailureReceivedArguments: (request: ApiRequestProtocol, success: (ApiResponseProtocol) -> Void, failure: (ApiError) -> Void)?
    var requestWithSuccessFailureReceivedInvocations: [(request: ApiRequestProtocol, success: (ApiResponseProtocol) -> Void, failure: (ApiError) -> Void)] = []
    var requestWithSuccessFailureClosure: ((ApiRequestProtocol, @escaping (ApiResponseProtocol) -> Void, @escaping (ApiError) -> Void) -> Void)?

    func request(with request: ApiRequestProtocol,               success: @escaping (ApiResponseProtocol) -> Void,               failure: @escaping (ApiError) -> Void) {
        requestWithSuccessFailureCallsCount += 1
        requestWithSuccessFailureReceivedArguments = (request: request, success: success, failure: failure)
        requestWithSuccessFailureReceivedInvocations.append((request: request, success: success, failure: failure))
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
    var headers: [String: String]?

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
class CategoriesInteractorInputMock: CategoriesInteractorInput {

    //MARK: - retrieve

    var retrieveCallsCount = 0
    var retrieveCalled: Bool {
        return retrieveCallsCount > 0
    }
    var retrieveClosure: (() -> Void)?

    func retrieve() {
        retrieveCallsCount += 1
        retrieveClosure?()
    }

    //MARK: - numberOfCategories

    var numberOfCategoriesCallsCount = 0
    var numberOfCategoriesCalled: Bool {
        return numberOfCategoriesCallsCount > 0
    }
    var numberOfCategoriesReturnValue: Int!
    var numberOfCategoriesClosure: (() -> Int)?

    func numberOfCategories() -> Int {
        numberOfCategoriesCallsCount += 1
        return numberOfCategoriesClosure.map({ $0() }) ?? numberOfCategoriesReturnValue
    }

    //MARK: - numberOfItems

    var numberOfItemsForCategoryIndexCallsCount = 0
    var numberOfItemsForCategoryIndexCalled: Bool {
        return numberOfItemsForCategoryIndexCallsCount > 0
    }
    var numberOfItemsForCategoryIndexReceivedIndex: Int?
    var numberOfItemsForCategoryIndexReceivedInvocations: [Int] = []
    var numberOfItemsForCategoryIndexReturnValue: Int!
    var numberOfItemsForCategoryIndexClosure: ((Int) -> Int)?

    func numberOfItems(forCategoryIndex index: Int) -> Int {
        numberOfItemsForCategoryIndexCallsCount += 1
        numberOfItemsForCategoryIndexReceivedIndex = index
        numberOfItemsForCategoryIndexReceivedInvocations.append(index)
        return numberOfItemsForCategoryIndexClosure.map({ $0(index) }) ?? numberOfItemsForCategoryIndexReturnValue
    }

    //MARK: - item

    var itemAtIndexForCategoryIndexCallsCount = 0
    var itemAtIndexForCategoryIndexCalled: Bool {
        return itemAtIndexForCategoryIndexCallsCount > 0
    }
    var itemAtIndexForCategoryIndexReceivedArguments: (index: Int, categoryIndex: Int)?
    var itemAtIndexForCategoryIndexReceivedInvocations: [(index: Int, categoryIndex: Int)] = []
    var itemAtIndexForCategoryIndexReturnValue: CategoryItemProtocol!
    var itemAtIndexForCategoryIndexClosure: ((Int, Int) -> CategoryItemProtocol)?

    func item(atIndex index: Int, forCategoryIndex categoryIndex: Int) -> CategoryItemProtocol {
        itemAtIndexForCategoryIndexCallsCount += 1
        itemAtIndexForCategoryIndexReceivedArguments = (index: index, categoryIndex: categoryIndex)
        itemAtIndexForCategoryIndexReceivedInvocations.append((index: index, categoryIndex: categoryIndex))
        return itemAtIndexForCategoryIndexClosure.map({ $0(index, categoryIndex) }) ?? itemAtIndexForCategoryIndexReturnValue
    }

    //MARK: - selectItem

    var selectItemAtIndexForCategoryIndexCallsCount = 0
    var selectItemAtIndexForCategoryIndexCalled: Bool {
        return selectItemAtIndexForCategoryIndexCallsCount > 0
    }
    var selectItemAtIndexForCategoryIndexReceivedArguments: (index: Int, categoryIndex: Int)?
    var selectItemAtIndexForCategoryIndexReceivedInvocations: [(index: Int, categoryIndex: Int)] = []
    var selectItemAtIndexForCategoryIndexClosure: ((Int, Int) -> Void)?

    func selectItem(atIndex index: Int, forCategoryIndex categoryIndex: Int) {
        selectItemAtIndexForCategoryIndexCallsCount += 1
        selectItemAtIndexForCategoryIndexReceivedArguments = (index: index, categoryIndex: categoryIndex)
        selectItemAtIndexForCategoryIndexReceivedInvocations.append((index: index, categoryIndex: categoryIndex))
        selectItemAtIndexForCategoryIndexClosure?(index, categoryIndex)
    }

}
class CategoriesInteractorOutputMock: CategoriesInteractorOutput {

    //MARK: - didRetrieve

    var didRetrieveCateogoriesCallsCount = 0
    var didRetrieveCateogoriesCalled: Bool {
        return didRetrieveCateogoriesCallsCount > 0
    }
    var didRetrieveCateogoriesReceivedCateogories: [CategoryItemProtocol]?
    var didRetrieveCateogoriesReceivedInvocations: [[CategoryItemProtocol]] = []
    var didRetrieveCateogoriesClosure: (([CategoryItemProtocol]) -> Void)?

    func didRetrieve(cateogories: [CategoryItemProtocol]) {
        didRetrieveCateogoriesCallsCount += 1
        didRetrieveCateogoriesReceivedCateogories = cateogories
        didRetrieveCateogoriesReceivedInvocations.append(cateogories)
        didRetrieveCateogoriesClosure?(cateogories)
    }

    //MARK: - didSelectItem

    var didSelectItemAtIndexForCategoryIndexCallsCount = 0
    var didSelectItemAtIndexForCategoryIndexCalled: Bool {
        return didSelectItemAtIndexForCategoryIndexCallsCount > 0
    }
    var didSelectItemAtIndexForCategoryIndexReceivedArguments: (item: CategoryItemProtocol, index: Int, categoryIndex: Int)?
    var didSelectItemAtIndexForCategoryIndexReceivedInvocations: [(item: CategoryItemProtocol, index: Int, categoryIndex: Int)] = []
    var didSelectItemAtIndexForCategoryIndexClosure: ((CategoryItemProtocol, Int, Int) -> Void)?

    func didSelectItem(_ item: CategoryItemProtocol, atIndex index: Int, forCategoryIndex categoryIndex: Int) {
        didSelectItemAtIndexForCategoryIndexCallsCount += 1
        didSelectItemAtIndexForCategoryIndexReceivedArguments = (item: item, index: index, categoryIndex: categoryIndex)
        didSelectItemAtIndexForCategoryIndexReceivedInvocations.append((item: item, index: index, categoryIndex: categoryIndex))
        didSelectItemAtIndexForCategoryIndexClosure?(item, index, categoryIndex)
    }

}
class CategoriesPresenterInputMock: CategoriesPresenterInput {

    //MARK: - viewDidLoad

    var viewDidLoadCallsCount = 0
    var viewDidLoadCalled: Bool {
        return viewDidLoadCallsCount > 0
    }
    var viewDidLoadClosure: (() -> Void)?

    func viewDidLoad() {
        viewDidLoadCallsCount += 1
        viewDidLoadClosure?()
    }

    //MARK: - didSelectRow

    var didSelectRowAtIndexPathCallsCount = 0
    var didSelectRowAtIndexPathCalled: Bool {
        return didSelectRowAtIndexPathCallsCount > 0
    }
    var didSelectRowAtIndexPathReceivedIndexPath: IndexPath?
    var didSelectRowAtIndexPathReceivedInvocations: [IndexPath] = []
    var didSelectRowAtIndexPathClosure: ((IndexPath) -> Void)?

    func didSelectRow(atIndexPath indexPath: IndexPath) {
        didSelectRowAtIndexPathCallsCount += 1
        didSelectRowAtIndexPathReceivedIndexPath = indexPath
        didSelectRowAtIndexPathReceivedInvocations.append(indexPath)
        didSelectRowAtIndexPathClosure?(indexPath)
    }

    //MARK: - numberOfSections

    var numberOfSectionsCallsCount = 0
    var numberOfSectionsCalled: Bool {
        return numberOfSectionsCallsCount > 0
    }
    var numberOfSectionsReturnValue: Int!
    var numberOfSectionsClosure: (() -> Int)?

    func numberOfSections() -> Int {
        numberOfSectionsCallsCount += 1
        return numberOfSectionsClosure.map({ $0() }) ?? numberOfSectionsReturnValue
    }

    //MARK: - numberOfRows

    var numberOfRowsInSectionCallsCount = 0
    var numberOfRowsInSectionCalled: Bool {
        return numberOfRowsInSectionCallsCount > 0
    }
    var numberOfRowsInSectionReceivedSection: Int?
    var numberOfRowsInSectionReceivedInvocations: [Int] = []
    var numberOfRowsInSectionReturnValue: Int!
    var numberOfRowsInSectionClosure: ((Int) -> Int)?

    func numberOfRows(inSection section: Int) -> Int {
        numberOfRowsInSectionCallsCount += 1
        numberOfRowsInSectionReceivedSection = section
        numberOfRowsInSectionReceivedInvocations.append(section)
        return numberOfRowsInSectionClosure.map({ $0(section) }) ?? numberOfRowsInSectionReturnValue
    }

    //MARK: - viewModelForRow

    var viewModelForRowAtIndexPathCallsCount = 0
    var viewModelForRowAtIndexPathCalled: Bool {
        return viewModelForRowAtIndexPathCallsCount > 0
    }
    var viewModelForRowAtIndexPathReceivedIndexPath: IndexPath?
    var viewModelForRowAtIndexPathReceivedInvocations: [IndexPath] = []
    var viewModelForRowAtIndexPathReturnValue: CategoryCellViewModelProtocol!
    var viewModelForRowAtIndexPathClosure: ((IndexPath) -> CategoryCellViewModelProtocol)?

    func viewModelForRow(atIndexPath indexPath: IndexPath) -> CategoryCellViewModelProtocol {
        viewModelForRowAtIndexPathCallsCount += 1
        viewModelForRowAtIndexPathReceivedIndexPath = indexPath
        viewModelForRowAtIndexPathReceivedInvocations.append(indexPath)
        return viewModelForRowAtIndexPathClosure.map({ $0(indexPath) }) ?? viewModelForRowAtIndexPathReturnValue
    }

}
class CategoriesPresenterOutputMock: CategoriesPresenterOutput {

    //MARK: - reloadData

    var reloadDataCallsCount = 0
    var reloadDataCalled: Bool {
        return reloadDataCallsCount > 0
    }
    var reloadDataClosure: (() -> Void)?

    func reloadData() {
        reloadDataCallsCount += 1
        reloadDataClosure?()
    }

    //MARK: - displayTitle

    var displayTitleCallsCount = 0
    var displayTitleCalled: Bool {
        return displayTitleCallsCount > 0
    }
    var displayTitleReceivedTitle: String?
    var displayTitleReceivedInvocations: [String] = []
    var displayTitleClosure: ((String) -> Void)?

    func displayTitle(_ title: String) {
        displayTitleCallsCount += 1
        displayTitleReceivedTitle = title
        displayTitleReceivedInvocations.append(title)
        displayTitleClosure?(title)
    }

}
class CategoriesRepositoryInputMock: CategoriesRepositoryInput {

    //MARK: - fetch

    var fetchSuccessFailureCallsCount = 0
    var fetchSuccessFailureCalled: Bool {
        return fetchSuccessFailureCallsCount > 0
    }
    var fetchSuccessFailureReceivedArguments: (success: ([CategoriesRepositoryResponseProtocol]) -> Void, failure: (CategoriesRepositoryError) -> Void)?
    var fetchSuccessFailureReceivedInvocations: [(success: ([CategoriesRepositoryResponseProtocol]) -> Void, failure: (CategoriesRepositoryError) -> Void)] = []
    var fetchSuccessFailureClosure: ((@escaping ([CategoriesRepositoryResponseProtocol]) -> Void, @escaping (CategoriesRepositoryError) -> Void) -> Void)?

    func fetch(success: @escaping ([CategoriesRepositoryResponseProtocol]) -> Void, failure: @escaping (CategoriesRepositoryError) -> Void) {
        fetchSuccessFailureCallsCount += 1
        fetchSuccessFailureReceivedArguments = (success: success, failure: failure)
        fetchSuccessFailureReceivedInvocations.append((success: success, failure: failure))
        fetchSuccessFailureClosure?(success, failure)
    }

}
class CategoriesRepositoryResponseProtocolMock: CategoriesRepositoryResponseProtocol {
    var categoryId: Int {
        get { return underlyingCategoryId }
        set(value) { underlyingCategoryId = value }
    }
    var underlyingCategoryId: Int!

}
class CategoryCellViewModelProtocolMock: CategoryCellViewModelProtocol {
    var title: String {
        get { return underlyingTitle }
        set(value) { underlyingTitle = value }
    }
    var underlyingTitle: String!

}
class CategoryItemProtocolMock: CategoryItemProtocol {
    var categoryId: Int {
        get { return underlyingCategoryId }
        set(value) { underlyingCategoryId = value }
    }
    var underlyingCategoryId: Int!

}
class ProductsListAggregationItemProtocolMock: ProductsListAggregationItemProtocol {
    var totalCount: Int?
    var skip: Int?
    var limit: Int?
    var scrollIdentifier: String?

}
class ProductsListCellViewModelProtocolMock: ProductsListCellViewModelProtocol {
    var imageUrl: String?
    var title: String {
        get { return underlyingTitle }
        set(value) { underlyingTitle = value }
    }
    var underlyingTitle: String!
    var price: String?

}
class ProductsListInteractorInputMock: ProductsListInteractorInput {

    //MARK: - retrieve

    var retrieveCallsCount = 0
    var retrieveCalled: Bool {
        return retrieveCallsCount > 0
    }
    var retrieveClosure: (() -> Void)?

    func retrieve() {
        retrieveCallsCount += 1
        retrieveClosure?()
    }

    //MARK: - retrieve

    var retrieveAtIndexForCategoryIndexCallsCount = 0
    var retrieveAtIndexForCategoryIndexCalled: Bool {
        return retrieveAtIndexForCategoryIndexCallsCount > 0
    }
    var retrieveAtIndexForCategoryIndexReceivedArguments: (index: Int, categoryIndex: Int)?
    var retrieveAtIndexForCategoryIndexReceivedInvocations: [(index: Int, categoryIndex: Int)] = []
    var retrieveAtIndexForCategoryIndexClosure: ((Int, Int) -> Void)?

    func retrieve(atIndex index: Int, forCategoryIndex categoryIndex: Int) {
        retrieveAtIndexForCategoryIndexCallsCount += 1
        retrieveAtIndexForCategoryIndexReceivedArguments = (index: index, categoryIndex: categoryIndex)
        retrieveAtIndexForCategoryIndexReceivedInvocations.append((index: index, categoryIndex: categoryIndex))
        retrieveAtIndexForCategoryIndexClosure?(index, categoryIndex)
    }

    //MARK: - numberOfCategories

    var numberOfCategoriesCallsCount = 0
    var numberOfCategoriesCalled: Bool {
        return numberOfCategoriesCallsCount > 0
    }
    var numberOfCategoriesReturnValue: Int!
    var numberOfCategoriesClosure: (() -> Int)?

    func numberOfCategories() -> Int {
        numberOfCategoriesCallsCount += 1
        return numberOfCategoriesClosure.map({ $0() }) ?? numberOfCategoriesReturnValue
    }

    //MARK: - numberOfItems

    var numberOfItemsForCategoryIndexCallsCount = 0
    var numberOfItemsForCategoryIndexCalled: Bool {
        return numberOfItemsForCategoryIndexCallsCount > 0
    }
    var numberOfItemsForCategoryIndexReceivedIndex: Int?
    var numberOfItemsForCategoryIndexReceivedInvocations: [Int] = []
    var numberOfItemsForCategoryIndexReturnValue: Int!
    var numberOfItemsForCategoryIndexClosure: ((Int) -> Int)?

    func numberOfItems(forCategoryIndex index: Int) -> Int {
        numberOfItemsForCategoryIndexCallsCount += 1
        numberOfItemsForCategoryIndexReceivedIndex = index
        numberOfItemsForCategoryIndexReceivedInvocations.append(index)
        return numberOfItemsForCategoryIndexClosure.map({ $0(index) }) ?? numberOfItemsForCategoryIndexReturnValue
    }

    //MARK: - item

    var itemAtIndexForCategoryIndexCallsCount = 0
    var itemAtIndexForCategoryIndexCalled: Bool {
        return itemAtIndexForCategoryIndexCallsCount > 0
    }
    var itemAtIndexForCategoryIndexReceivedArguments: (index: Int, categoryIndex: Int)?
    var itemAtIndexForCategoryIndexReceivedInvocations: [(index: Int, categoryIndex: Int)] = []
    var itemAtIndexForCategoryIndexReturnValue: ProductsListItemProtocol!
    var itemAtIndexForCategoryIndexClosure: ((Int, Int) -> ProductsListItemProtocol)?

    func item(atIndex index: Int, forCategoryIndex categoryIndex: Int) -> ProductsListItemProtocol {
        itemAtIndexForCategoryIndexCallsCount += 1
        itemAtIndexForCategoryIndexReceivedArguments = (index: index, categoryIndex: categoryIndex)
        itemAtIndexForCategoryIndexReceivedInvocations.append((index: index, categoryIndex: categoryIndex))
        return itemAtIndexForCategoryIndexClosure.map({ $0(index, categoryIndex) }) ?? itemAtIndexForCategoryIndexReturnValue
    }

    //MARK: - selectItem

    var selectItemAtIndexForCategoryIndexCallsCount = 0
    var selectItemAtIndexForCategoryIndexCalled: Bool {
        return selectItemAtIndexForCategoryIndexCallsCount > 0
    }
    var selectItemAtIndexForCategoryIndexReceivedArguments: (index: Int, categoryIndex: Int)?
    var selectItemAtIndexForCategoryIndexReceivedInvocations: [(index: Int, categoryIndex: Int)] = []
    var selectItemAtIndexForCategoryIndexClosure: ((Int, Int) -> Void)?

    func selectItem(atIndex index: Int, forCategoryIndex categoryIndex: Int) {
        selectItemAtIndexForCategoryIndexCallsCount += 1
        selectItemAtIndexForCategoryIndexReceivedArguments = (index: index, categoryIndex: categoryIndex)
        selectItemAtIndexForCategoryIndexReceivedInvocations.append((index: index, categoryIndex: categoryIndex))
        selectItemAtIndexForCategoryIndexClosure?(index, categoryIndex)
    }

}
class ProductsListInteractorOutputMock: ProductsListInteractorOutput {

    //MARK: - didReceive

    var didReceiveCallsCount = 0
    var didReceiveCalled: Bool {
        return didReceiveCallsCount > 0
    }
    var didReceiveClosure: (() -> Void)?

    func didReceive() {
        didReceiveCallsCount += 1
        didReceiveClosure?()
    }

    //MARK: - didReceiveNext

    var didReceiveNextCallsCount = 0
    var didReceiveNextCalled: Bool {
        return didReceiveNextCallsCount > 0
    }
    var didReceiveNextClosure: (() -> Void)?

    func didReceiveNext() {
        didReceiveNextCallsCount += 1
        didReceiveNextClosure?()
    }

    //MARK: - didReceiveError

    var didReceiveErrorCallsCount = 0
    var didReceiveErrorCalled: Bool {
        return didReceiveErrorCallsCount > 0
    }
    var didReceiveErrorClosure: (() -> Void)?

    func didReceiveError() {
        didReceiveErrorCallsCount += 1
        didReceiveErrorClosure?()
    }

}
class ProductsListItemProtocolMock: ProductsListItemProtocol {
    var id: String {
        get { return underlyingId }
        set(value) { underlyingId = value }
    }
    var underlyingId: String!
    var title: String {
        get { return underlyingTitle }
        set(value) { underlyingTitle = value }
    }
    var underlyingTitle: String!
    var imageUrl: String?
    var ratings: Float?
    var price: ProductsListPriceItemProtocol?

}
class ProductsListPresenterInputMock: ProductsListPresenterInput {

    //MARK: - viewDidLoad

    var viewDidLoadCallsCount = 0
    var viewDidLoadCalled: Bool {
        return viewDidLoadCallsCount > 0
    }
    var viewDidLoadClosure: (() -> Void)?

    func viewDidLoad() {
        viewDidLoadCallsCount += 1
        viewDidLoadClosure?()
    }

    //MARK: - didSelectRow

    var didSelectRowAtIndexPathCallsCount = 0
    var didSelectRowAtIndexPathCalled: Bool {
        return didSelectRowAtIndexPathCallsCount > 0
    }
    var didSelectRowAtIndexPathReceivedIndexPath: IndexPath?
    var didSelectRowAtIndexPathReceivedInvocations: [IndexPath] = []
    var didSelectRowAtIndexPathClosure: ((IndexPath) -> Void)?

    func didSelectRow(atIndexPath indexPath: IndexPath) {
        didSelectRowAtIndexPathCallsCount += 1
        didSelectRowAtIndexPathReceivedIndexPath = indexPath
        didSelectRowAtIndexPathReceivedInvocations.append(indexPath)
        didSelectRowAtIndexPathClosure?(indexPath)
    }

    //MARK: - numberOfSections

    var numberOfSectionsCallsCount = 0
    var numberOfSectionsCalled: Bool {
        return numberOfSectionsCallsCount > 0
    }
    var numberOfSectionsReturnValue: Int!
    var numberOfSectionsClosure: (() -> Int)?

    func numberOfSections() -> Int {
        numberOfSectionsCallsCount += 1
        return numberOfSectionsClosure.map({ $0() }) ?? numberOfSectionsReturnValue
    }

    //MARK: - numberOfRows

    var numberOfRowsInSectionCallsCount = 0
    var numberOfRowsInSectionCalled: Bool {
        return numberOfRowsInSectionCallsCount > 0
    }
    var numberOfRowsInSectionReceivedSection: Int?
    var numberOfRowsInSectionReceivedInvocations: [Int] = []
    var numberOfRowsInSectionReturnValue: Int!
    var numberOfRowsInSectionClosure: ((Int) -> Int)?

    func numberOfRows(inSection section: Int) -> Int {
        numberOfRowsInSectionCallsCount += 1
        numberOfRowsInSectionReceivedSection = section
        numberOfRowsInSectionReceivedInvocations.append(section)
        return numberOfRowsInSectionClosure.map({ $0(section) }) ?? numberOfRowsInSectionReturnValue
    }

    //MARK: - viewModelForRow

    var viewModelForRowAtIndexPathCallsCount = 0
    var viewModelForRowAtIndexPathCalled: Bool {
        return viewModelForRowAtIndexPathCallsCount > 0
    }
    var viewModelForRowAtIndexPathReceivedIndexPath: IndexPath?
    var viewModelForRowAtIndexPathReceivedInvocations: [IndexPath] = []
    var viewModelForRowAtIndexPathReturnValue: ProductsListCellViewModelProtocol!
    var viewModelForRowAtIndexPathClosure: ((IndexPath) -> ProductsListCellViewModelProtocol)?

    func viewModelForRow(atIndexPath indexPath: IndexPath) -> ProductsListCellViewModelProtocol {
        viewModelForRowAtIndexPathCallsCount += 1
        viewModelForRowAtIndexPathReceivedIndexPath = indexPath
        viewModelForRowAtIndexPathReceivedInvocations.append(indexPath)
        return viewModelForRowAtIndexPathClosure.map({ $0(indexPath) }) ?? viewModelForRowAtIndexPathReturnValue
    }

    //MARK: - willDisplayItem

    var willDisplayItemAtIndexPathCallsCount = 0
    var willDisplayItemAtIndexPathCalled: Bool {
        return willDisplayItemAtIndexPathCallsCount > 0
    }
    var willDisplayItemAtIndexPathReceivedIndexPath: IndexPath?
    var willDisplayItemAtIndexPathReceivedInvocations: [IndexPath] = []
    var willDisplayItemAtIndexPathClosure: ((IndexPath) -> Void)?

    func willDisplayItem(atIndexPath indexPath: IndexPath) {
        willDisplayItemAtIndexPathCallsCount += 1
        willDisplayItemAtIndexPathReceivedIndexPath = indexPath
        willDisplayItemAtIndexPathReceivedInvocations.append(indexPath)
        willDisplayItemAtIndexPathClosure?(indexPath)
    }

}
class ProductsListPresenterOutputMock: ProductsListPresenterOutput {

    //MARK: - reloaData

    var reloaDataCallsCount = 0
    var reloaDataCalled: Bool {
        return reloaDataCallsCount > 0
    }
    var reloaDataClosure: (() -> Void)?

    func reloaData() {
        reloaDataCallsCount += 1
        reloaDataClosure?()
    }

    //MARK: - displayError

    var displayErrorCallsCount = 0
    var displayErrorCalled: Bool {
        return displayErrorCallsCount > 0
    }
    var displayErrorReceivedMessage: String?
    var displayErrorReceivedInvocations: [String] = []
    var displayErrorClosure: ((String) -> Void)?

    func displayError(_ message: String) {
        displayErrorCallsCount += 1
        displayErrorReceivedMessage = message
        displayErrorReceivedInvocations.append(message)
        displayErrorClosure?(message)
    }

    //MARK: - displayTitle

    var displayTitleCallsCount = 0
    var displayTitleCalled: Bool {
        return displayTitleCallsCount > 0
    }
    var displayTitleReceivedTitle: String?
    var displayTitleReceivedInvocations: [String] = []
    var displayTitleClosure: ((String) -> Void)?

    func displayTitle(_ title: String) {
        displayTitleCallsCount += 1
        displayTitleReceivedTitle = title
        displayTitleReceivedInvocations.append(title)
        displayTitleClosure?(title)
    }

}
class ProductsListPriceItemProtocolMock: ProductsListPriceItemProtocol {
    var currency: String?
    var value: String?

}
class ProductsListRepositoryInputMock: ProductsListRepositoryInput {

    //MARK: - fetch

    var fetchWithSuccessFailureCallsCount = 0
    var fetchWithSuccessFailureCalled: Bool {
        return fetchWithSuccessFailureCallsCount > 0
    }
    var fetchWithSuccessFailureReceivedArguments: (parameters: ProductsListRepositoryParametersProtocol, success: (ProductsListRepositoryResponseProtocol) -> Void, failure: (ProductsListRepositoryError) -> Void)?
    var fetchWithSuccessFailureReceivedInvocations: [(parameters: ProductsListRepositoryParametersProtocol, success: (ProductsListRepositoryResponseProtocol) -> Void, failure: (ProductsListRepositoryError) -> Void)] = []
    var fetchWithSuccessFailureClosure: ((ProductsListRepositoryParametersProtocol, @escaping (ProductsListRepositoryResponseProtocol) -> Void, @escaping (ProductsListRepositoryError) -> Void) -> Void)?

    func fetch(with parameters: ProductsListRepositoryParametersProtocol,             success: @escaping (ProductsListRepositoryResponseProtocol) -> Void,             failure: @escaping (ProductsListRepositoryError) -> Void) {
        fetchWithSuccessFailureCallsCount += 1
        fetchWithSuccessFailureReceivedArguments = (parameters: parameters, success: success, failure: failure)
        fetchWithSuccessFailureReceivedInvocations.append((parameters: parameters, success: success, failure: failure))
        fetchWithSuccessFailureClosure?(parameters, success, failure)
    }

}
class ProductsListRepositoryParametersProtocolMock: ProductsListRepositoryParametersProtocol {
    var text: String?
    var sort: String?
    var currency: String?
    var category: Int?
    var skip: Int?
    var limit: Int?
    var scrollPagination: Bool?
    var sortDirection: String?
    var scrollIdentifier: String?

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
class RouterInputMock: RouterInput {

    //MARK: - initialViewController

    var initialViewControllerCallsCount = 0
    var initialViewControllerCalled: Bool {
        return initialViewControllerCallsCount > 0
    }
    var initialViewControllerReturnValue: UIViewController!
    var initialViewControllerClosure: (() -> UIViewController)?

    func initialViewController() -> UIViewController {
        initialViewControllerCallsCount += 1
        return initialViewControllerClosure.map({ $0() }) ?? initialViewControllerReturnValue
    }

    //MARK: - routeToProductsList

    var routeToProductsListWithCallsCount = 0
    var routeToProductsListWithCalled: Bool {
        return routeToProductsListWithCallsCount > 0
    }
    var routeToProductsListWithReceivedCategoryId: Int?
    var routeToProductsListWithReceivedInvocations: [Int] = []
    var routeToProductsListWithClosure: ((Int) -> Void)?

    func routeToProductsList(with categoryId: Int) {
        routeToProductsListWithCallsCount += 1
        routeToProductsListWithReceivedCategoryId = categoryId
        routeToProductsListWithReceivedInvocations.append(categoryId)
        routeToProductsListWithClosure?(categoryId)
    }

}
