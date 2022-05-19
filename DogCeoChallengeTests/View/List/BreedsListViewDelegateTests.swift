import XCTest
@testable import DogCeoChallenge

class BreedsListViewDelegateTests: XCTestCase {
    var sut: BreedsListViewDelegate!
    var viewController: BreedsListViewControllerMock!
    var breedsListView: BreedsListViewMock!
    
    override func setUp() {
        super.setUp()
        sut = BreedsListViewDelegate()
        let breedsArray = [BreedsViewModel(name: "asdf")]
        breedsListView = BreedsListViewMock(breedsArray: breedsArray, breedsListTable: UITableView())
        let serviceLocator = DogCeoServiceLocator()
        let presenter = BreedsListPresenter(getBreedsListUseCase: serviceLocator.getBreedsListUseCase, breedsMapper: serviceLocator.getBreedsViewModelToBreedsListMapper)
        viewController = BreedsListViewControllerMock(viewDataSource: BreedsListViewDataSource(), viewDelegate: sut, presenter: presenter)
        presenter.view = breedsListView
        sut.view = breedsListView
        //viewController.viewDidLoad()
    }
    
    override func tearDown() {
        sut = nil
        viewController = nil
        super.tearDown()
    }
    
    func testShowNextViewControllerIsCalled() {
        let tableView = viewController.view.subviews[0] as! UITableView
        sut.tableView(tableView, didSelectRowAt: IndexPath(row: 0, section: 0))
        XCTAssertTrue(breedsListView.showNextViewControllerCalled)
    }

    /*
    func testHeightForRowAt() {
        let expectedHeight: CGFloat = 50
        let tableView = viewController.view.subviews[0] as! UITableView
        let cell = tableView.cellForRow(at: IndexPath(row: 0, section: 0))
        let actualHeight = cell!.intrinsicContentSize.height
        XCTAssertEqual(expectedHeight, actualHeight)
    }
    */
}
