import XCTest
@testable import DogCeoChallenge

class DogsPicturesViewDelegateTests: XCTestCase {
    var sut: DogsPicturesViewDelegate!
    
    override func setUp() {
        super.setUp()
        sut = DogsPicturesViewDelegate()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
}
