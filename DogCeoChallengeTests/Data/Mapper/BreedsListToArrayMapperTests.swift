import XCTest
@testable import DogCeoChallenge

class BreedsListToArrayMapperTests: XCTestCase {
    var sut: BreedsListToArrayMapper!
    
    override func setUp() {
        super.setUp()
        sut = BreedsListToArrayMapper()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testReverseMapSuccess() {
        let entity = ["", ""]
        let expectedModel = BreedsList(message: entity)
        let model = sut.reverseMap(value: entity)
        XCTAssertEqual(expectedModel.message, model.message)
    }
}
