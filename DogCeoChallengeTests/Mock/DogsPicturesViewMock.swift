@testable import DogCeoChallenge

class DogsPicturesViewMock: DogsPicturesView {
    var displayListCalled = false
    var displayErrorCalled = false
    
    func displayList(_ list: [PicturesViewModel]) {
        displayListCalled = true
    }
    
    func displayError() {
        displayErrorCalled = true
    }
}
