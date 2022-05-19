@testable import DogCeoChallenge

class BreedsListViewMock: BreedsListView {
    var breedsArray: [BreedsViewModel]
    
    var displayListCalled = false
    var displayErrorCalled = false
    var showNextViewControllerCalled = false
    
    init(breedsArray: [BreedsViewModel]) {
        self.breedsArray = breedsArray
    }
    
    func displayList(_ list: [BreedsViewModel]) {
        displayListCalled = true
    }
    
    func displayError() {
        displayErrorCalled = true
    }
    
    func showNextViewController(name: String) {
        showNextViewControllerCalled = true
    }
}
