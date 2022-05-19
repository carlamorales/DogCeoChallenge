import UIKit
@testable import DogCeoChallenge

class BreedsListViewMock: BreedsListView {
    var breedsArray: [BreedsViewModel]
    var breedsListTable: UITableView
    
    var displayListCalled = false
    var displayErrorCalled = false
    var showNextViewControllerCalled = false
    
    init(breedsArray: [BreedsViewModel], breedsListTable: UITableView) {
        self.breedsArray = breedsArray
        self.breedsListTable = breedsListTable
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
