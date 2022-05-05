import XCTest
@testable import DogCeoChallenge

class GetBreedsListUseCaseTests: XCTestCase {
    var sut: GetBreedsListUseCase!
    var dogRepository: DogRepositoryMock!
    
    override func setUp() {
        super.setUp()
        dogRepository = DogRepositoryMock()
        sut = GetBreedsListUseCase(dogRepository: dogRepository)
    }
    
    override func tearDown() {
        sut = nil
        dogRepository = nil
        super.tearDown()
    }
    
    func testExecuteSuccess() {
        let expectation = expectation(description: "testExecuteSuccess")
        sut.execute { list, error in
            XCTAssertNotNil(list)
            XCTAssertNil(error)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 2)
    }
    
    func testExecuteFailure() {
        dogRepository.shouldFail = true
        let expectation = expectation(description: "testExecuteFailure")
        sut.execute { list, error in
            XCTAssertNil(list)
            XCTAssertNotNil(error)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 2)
    }
}
