import XCTest
import Mimic
@testable import DogCeoChallenge

class AlamofireApiCallTests: XCTestCase {
    var sut: AlamofireApiCall!
    
    override func setUp() {
        super.setUp()
        Mimic.start()
        sut = AlamofireApiCall()
    }
    
    override func tearDown() {
        sut = nil
        Mimic.stopAllMimics()
        super.tearDown()
    }
    
    /* testeando fetchApiData */
    func testFetchApiDataSuccess() {
        let request = request(with: .get, url: "https://dog.ceo/api/breeds/list")
        let body: [String: Any] = [
            "message": ["affenpinscher", "african"]
        ]
        let response = response(with: body)
        Mimic.mimic(request: request, response: response)
        
        let expectation = expectation(description: "testFetchApiDataSuccess")
        sut.fetchApiData { list, error in
            XCTAssertNotNil(list)
            XCTAssertNil(error)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 2)
    }
    
    func testFetchApiDataInvalidModel() {
        let request = request(with: .get, url: "https://dog.ceo/api/breeds/list")
        let body: [String: Any] = [
            "invalidKey": ["affenpinscher", "african"]
        ]
        let response = response(with: body)
        Mimic.mimic(request: request, response: response)
        
        let expectation = expectation(description: "testFetchApiDataInvalidModel")
        sut.fetchApiData { list, error in
            XCTAssertNil(list)
            XCTAssertNotNil(error)
            XCTAssertEqual(error?.errorMessage, "Invalid model")
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 2)
    }
    
    /* testeando fetchApiPictures */
    func testFetchApiPicturesSuccess() {
        let request = request(with: .get, url: "https://dog.ceo/api/breed/asdf/images")
        let body: [String: Any] = [
            "message": ["", ""]
        ]
        let response = response(with: body)
        Mimic.mimic(request: request, response: response)
        
        let expectation = expectation(description: "testFetchApiPicturesSuccess")
        sut.fetchApiPictures(breed: "asdf") { list, error in
            XCTAssertNotNil(list)
            XCTAssertNil(error)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 2)
    }
    
    func testFetchApiPicturesInvalidModel() {
        let request = request(with: .get, url: "https://dog.ceo/api/breed/asdf/images")
        let body: [String: Any] = [
            "invalidKey": ["", ""]
        ]
        let response = response(with: body)
        Mimic.mimic(request: request, response: response)
        
        let expectation = expectation(description: "testFetchApiPicturesInvalidModel")
        sut.fetchApiPictures(breed: "asdf") { list, error in
            XCTAssertNil(list)
            XCTAssertNotNil(error)
            XCTAssertEqual(error?.errorMessage, "Invalid model")
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 2)
    }
}
