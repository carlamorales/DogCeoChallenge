@testable import DogCeoChallenge

class BreedsListViewMock: BreedsListView {
    var displayListCalled = false
    var displayErrorCalled = false
    
    func displayList(_ list: [BreedsViewModel]) {
        displayListCalled = true
    }
    
    func displayError() {
        displayErrorCalled = true
    }
}
