import XCTest
@testable import DogCeoChallenge

class BreedsListViewDataSourceTests: XCTestCase {
    var sut: BreedsListViewDataSource!
    var viewController: BreedsListViewController!
    
    override func setUp() {
        super.setUp()
        sut = BreedsListViewDataSource()
        viewController = BreedsListViewController()
        sut.view = viewController
    }
    
    override func tearDown() {
        sut = nil
        viewController = nil
        super.tearDown()
    }
    
    func testNumberOfRowsInSection() {
        viewController.breedsArray = [BreedsViewModel(name: "asdf"), BreedsViewModel(name: "jklñ")]
        let rows = sut.tableView(UITableView(), numberOfRowsInSection: 0)
        XCTAssertEqual(rows, 2)
    }
    
    func testNumberOfRowsInSectionWithNil() {
        sut.view = nil
        let rows = sut.tableView(UITableView(), numberOfRowsInSection: 0)
        XCTAssertEqual(rows, 0)
    }
    
    func testCellForRowAt() {
        viewController.breedsArray = [BreedsViewModel(name: "asdf")]
        let tableView = viewController.view.subviews[0] as! UITableView
        let cell = sut.tableView(tableView, cellForRowAt: IndexPath(row: 0, section: 0)) as! BreedsListTableViewCell
        XCTAssertEqual(cell.breedLabel.text, "asdf")
    }
}
