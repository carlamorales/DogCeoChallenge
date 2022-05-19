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
    
    /*
    func testCellForRowAt() {
        let expectation = expectation(description: "testCellForRowAt")
        viewController.picturesArray = [PicturesViewModel(name: "https://olondriz.com/wp-content/uploads/2020/04/ambar-perrito-1.jpg")]
        let tableView = viewController.view.subviews[0] as! UITableView
        let cell = sut.tableView(tableView, cellForRowAt: IndexPath(row: 0, section: 0)) as! DogsPicturesTableViewCell
        let image = UIImage(named: "perrito")
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 2)
        XCTAssertEqual(cell.dogImageView.image?.pngData(), image?.pngData())
    }
    */
}
