import XCTest
@testable import DogCeoChallenge

class BreedsListViewDelegateTests: XCTestCase {
    var sut: BreedsListViewDelegate!
    
    override func setUp() {
        super.setUp()
        sut = BreedsListViewDelegate()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
}
