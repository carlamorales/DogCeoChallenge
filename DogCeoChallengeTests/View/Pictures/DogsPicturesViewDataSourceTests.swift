import XCTest
@testable import DogCeoChallenge

class DogsPicturesViewDataSourceTests: XCTestCase {
    var sut: DogsPicturesViewDataSource!
    
    override func setUp() {
        super.setUp()
        sut = DogsPicturesViewDataSource()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testNumberOfRowInSection() {
        let viewController = DogsPicturesViewController()
        viewController.picturesArray = [PicturesViewModel(name: "asdf"), PicturesViewModel(name: "ghjk")]
        sut.view = viewController
        let rows = sut.tableView(UITableView(), numberOfRowsInSection: 0)
        XCTAssertEqual(rows, 2)
    }
    
    func testNumberOfRowInSectionWithNilView() {
        sut.view = nil
        let rows = sut.tableView(UITableView(), numberOfRowsInSection: 0)
        XCTAssertEqual(rows, 0)
    }
    
}
