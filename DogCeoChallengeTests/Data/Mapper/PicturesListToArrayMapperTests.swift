import XCTest
@testable import DogCeoChallenge

class PicturesListToArrayMapperTests: XCTestCase {
    var sut: PicturesListToArrayMapper!
    
    override func setUp() {
        super.setUp()
        sut = PicturesListToArrayMapper()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testReverseMapSuccess() {
        let entity = ["", ""]
        let expectedModel = PicturesList(message: entity)
        let model = sut.reverseMap(value: entity)
        XCTAssertEqual(expectedModel.message, model.message)
    }
}
