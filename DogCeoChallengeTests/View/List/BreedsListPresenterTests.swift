import XCTest
@testable import DogCeoChallenge

class BreedsListPresenterTests: XCTestCase {
    var sut: BreedsListPresenter!
    var breedsListView: BreedsListViewMock!
    var dogRepository: DogRepositoryMock!
     
    override func setUp() {
        super.setUp()
        breedsListView = BreedsListViewMock()
        dogRepository = DogRepositoryMock()
        let getBreedsListUseCase = GetBreedsListUseCase(dogRepository: dogRepository)
        let breedsMapper = BreedsViewModelToBreedsListMapper()
        sut = BreedsListPresenter(getBreedsListUseCase: getBreedsListUseCase, breedsMapper: breedsMapper)
        sut.view = breedsListView
    }
    
    override func tearDown() {
        sut = nil
        breedsListView = nil
        dogRepository = nil
        super.tearDown()
    }
    
    func testGetBreedsListSuccess() {
        sut.getBreedsList()
        XCTAssertTrue(breedsListView.displayListCalled)
        XCTAssertFalse(breedsListView.displayErrorCalled)
    }
    
    func testGetBreedsListFailure() {
        dogRepository.shouldFail = true
        sut.getBreedsList()
        XCTAssertTrue(breedsListView.displayErrorCalled)
        XCTAssertFalse(breedsListView.displayListCalled)
    }
}
