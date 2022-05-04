import XCTest
@testable import DogCeoChallenge

class DogApiRepositoryTests: XCTestCase {
    var sut: DogApiRepository!
    var restApi: ApiRestMock!
    
    override func setUp() {
        super.setUp()
        restApi = ApiRestMock()
        let breedsMapper = BreedsListToArrayMapper()
        let picturesMapper = PicturesListToArrayMapper()
        sut = DogApiRepository(restApi: restApi, breedsMapper: breedsMapper, picturesMapper: picturesMapper)
    }
    
    override func tearDown() {
        sut = nil
        restApi = nil
        super.tearDown()
    }
    
    /* testeando fetchDogBreeds */
    func testFetchDogBreedsSuccess() {
        let expectation = expectation(description: "testFetchDogBreedsSuccess")
        sut.fetchDogBreeds { list, error in
            XCTAssertNotNil(list)
            XCTAssertNil(error)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 2)
    }
    
    func testFetchDogBreedsFailure() {
        restApi.shouldFail = true
        let expectation = expectation(description: "testFetchDogBreedsFailure")
        sut.fetchDogBreeds { list, error in
            XCTAssertNil(list)
            XCTAssertNotNil(error)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 2)
    }
    
    /* testeando fetchDogPictures */
    func testFetchDogPicturesSuccess() {
        let expectation = expectation(description: "testFetchDogPicturesSuccess")
        sut.fetchDogPictures(breed: "") { list, error in
            XCTAssertNotNil(list)
            XCTAssertNil(error)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 2)
    }
    
    func testFetchDogPicturesFailure() {
        restApi.shouldFail = true
        let expectations = expectation(description: "testFetchDogPicturesFailure")
        sut.fetchDogPictures(breed: "") { list, error in
            XCTAssertNil(list)
            XCTAssertNotNil(error)
            expectations.fulfill()
        }
        wait(for: [expectations], timeout: 2)
    }
}
