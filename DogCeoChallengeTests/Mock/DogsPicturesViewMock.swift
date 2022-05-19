@testable import DogCeoChallenge

class DogsPicturesViewMock: DogsPicturesView {
    var picturesArray: [PicturesViewModel]
    
    var displayListCalled = false
    var displayErrorCalled = false
    
    init(picturesArray: [PicturesViewModel]) {
        self.picturesArray = picturesArray
    }
    
    func displayList(_ list: [PicturesViewModel]) {
        displayListCalled = true
    }
    
    func displayError() {
        displayErrorCalled = true
    }
}
