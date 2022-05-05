import XCTest
@testable import DogCeoChallenge

class GetPicturesListUseCaseTests: XCTestCase {
    var sut: GetPicturesListUseCase!
    var dogRepository: DogRepositoryMock!
    
    override func setUp() {
        super.setUp()
        dogRepository = DogRepositoryMock()
        sut = GetPicturesListUseCase(dogRepository: dogRepository)
    }
    
    override func tearDown() {
        sut = nil
        dogRepository = nil
        super.tearDown()
    }
    
    func testExecuteSuccess() {
        let expectation = expectation(description: "testExecuteSuccess")
        sut.execute(breed: "") { list, error in
            XCTAssertNotNil(list)
            XCTAssertNil(error)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 2)
    }
    
    func testExecuteFailure() {
        dogRepository.shouldFail = true
        let expectation = expectation(description: "testExecuteFailure")
        sut.execute(breed: "") { list, error in
            XCTAssertNil(list)
            XCTAssertNotNil(error)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 2)
    }
}
