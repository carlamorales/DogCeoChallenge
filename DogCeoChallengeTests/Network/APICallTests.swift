import XCTest
@testable import DogCeoChallenge

class APICallTests: XCTestCase {
    var sut: APICall!
    
    override func setUp() {
        sut = APICall()
        super.setUp()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testSuccess() {
        let expectation = expectation(description: "testSuccess")
        sut.fetchApiData { list, error in
            XCTAssertNotNil(list)
            XCTAssertNil(error)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 2)
    }
}
