import XCTest
@testable import DogCeoChallenge

class PicturesViewModelToPicturesListMapperTests: XCTestCase {
    var sut: PicturesViewModelToPicturesListMapper!
    
    override func setUp() {
        super.setUp()
        sut = PicturesViewModelToPicturesListMapper()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testReverseMapSuccess() {
        let entity = PicturesList(message: ["a", "b"])
        let expectedModel = entity.message.map { PicturesViewModel(name: $0)}
        let model = sut.reverseMap(value: entity)
        //XCTAssertEqual(expectedModel.first!.name, model.first!.name)
        XCTAssertEqual(expectedModel[0].name, model[0].name)
        XCTAssertEqual(expectedModel[1].name, model[1].name)
    }
}
