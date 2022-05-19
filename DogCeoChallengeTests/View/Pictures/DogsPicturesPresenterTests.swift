import XCTest
@testable import DogCeoChallenge

class DogsPicturesPresenterTests: XCTestCase {
    var sut: DogsPicturesPresenter!
    var dogsPicturesView: DogsPicturesViewMock!
    var dogRepository: DogRepositoryMock!
    
    override func setUp() {
        super.setUp()
        let picturesArray = [PicturesViewModel(name: "asdf")]
        dogsPicturesView = DogsPicturesViewMock(picturesArray: picturesArray)
        dogRepository = DogRepositoryMock()
        let getPicturesListUseCase = GetPicturesListUseCase(dogRepository: dogRepository)
        let picturesMapper = PicturesViewModelToPicturesListMapper()
        sut = DogsPicturesPresenter(getPicturesListUseCase: getPicturesListUseCase, picturesMapper: picturesMapper)
        sut.view = dogsPicturesView
    }
    
    override func tearDown() {
        sut = nil
        dogsPicturesView = nil
        dogRepository = nil
        super.tearDown()
    }
    
    func testGetPicturesListSuccess() {
        sut.getPicturesList(breed: "")
        XCTAssertTrue(dogsPicturesView.displayListCalled)
        XCTAssertFalse(dogsPicturesView.displayErrorCalled)
    }
    
    func testGetPicturesListFailure() {
        dogRepository.shouldFail = true
        sut.getPicturesList(breed: "")
        XCTAssertTrue(dogsPicturesView.displayErrorCalled)
        XCTAssertFalse(dogsPicturesView.displayListCalled)
    }
}
