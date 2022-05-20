import XCTest
@testable import DogCeoChallenge

class BreedsListViewDelegateTests: XCTestCase {
    var sut: BreedsListViewDelegate!
    var viewController: BreedsListViewControllerMock!
    var breedsListView: BreedsListViewMock!
    
    override func setUp() {
        super.setUp()
        sut = BreedsListViewDelegate()
        let serviceLocator = DogCeoServiceLocator()
        let presenter = BreedsListPresenter(getBreedsListUseCase: serviceLocator.getBreedsListUseCase, breedsMapper: serviceLocator.getBreedsViewModelToBreedsListMapper)
        viewController = BreedsListViewControllerMock(viewDataSource: BreedsListViewDataSource(), viewDelegate: sut, presenter: presenter)
        let breedsArray = [BreedsViewModel(name: "asdf")]
        breedsListView = BreedsListViewMock(breedsListTable: UITableView(), breedsArray: breedsArray)
        sut.view = breedsListView
    }
    
    override func tearDown() {
        sut = nil
        viewController = nil
        breedsListView = nil
        super.tearDown()
    }
    
    func testShowNextViewControllerIsCalled() {
        let tableView = viewController.view.subviews[0] as! UITableView
        sut.tableView(tableView, didSelectRowAt: IndexPath(row: 0, section: 0))
        XCTAssertTrue(breedsListView.showNextViewControllerCalled)
    }
}
