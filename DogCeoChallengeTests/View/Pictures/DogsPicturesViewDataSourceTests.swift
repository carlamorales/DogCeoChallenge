import XCTest
@testable import DogCeoChallenge

class DogsPicturesViewDataSourceTests: XCTestCase {
    var sut: DogsPicturesViewDataSource!
    var viewController: DogsPicturesViewController!
    
    override func setUp() {
        super.setUp()
        sut = DogsPicturesViewDataSource()
        viewController = DogsPicturesViewController()
        sut.view = viewController
    }
    
    override func tearDown() {
        sut = nil
        viewController = nil
        super.tearDown()
    }
    
    func testNumberOfRowsInSection() {
        viewController.picturesArray = [PicturesViewModel(name: "asdf"), PicturesViewModel(name: "jklñ")]
        let rows = sut.tableView(UITableView(), numberOfRowsInSection: 0)
        XCTAssertEqual(rows, 2)
    }
    
    func testNumberOfRowsInSectionWithNil() {
        sut.view = nil
        let rows = sut.tableView(UITableView(), numberOfRowsInSection: 0)
        XCTAssertEqual(rows, 0)
    }
    
    
    func testCellForRowAt() {
        viewController.picturesArray = [PicturesViewModel(name: "asdf")]
        let tableView = viewController.view.subviews[0] as! UITableView
        let cell = sut.tableView(tableView, cellForRowAt: IndexPath(row: 0, section: 0)) as! DogsPicturesTableViewCell
        XCTAssertTrue((cell as Any) is DogsPicturesTableViewCell)
    }
    
    func testCellForRow() {
        let tableView = viewController.view.subviews[0] as! UITableView
        sut.view = nil
        let cell = sut.tableView(tableView, cellForRowAt: IndexPath(row: 0, section: 0))
        XCTAssertTrue((cell as Any) is UITableViewCell)
    }
    
}
