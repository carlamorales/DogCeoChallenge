import UIKit
@testable import DogCeoChallenge

class BreedsListViewMock: BreedsListView {
    var breedsListTable: UITableView
    var breedsArray: [BreedsViewModel]
    
    var displayListCalled = false
    var displayErrorCalled = false
    var showNextViewControllerCalled = false
    
    init(breedsListTable: UITableView, breedsArray: [BreedsViewModel]) {
        self.breedsListTable = breedsListTable
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
