import UIKit
@testable import DogCeoChallenge

class DogsPicturesViewMock: DogsPicturesView {
    var dogsPicturesTable: UITableView
    var picturesArray: [PicturesViewModel]
    
    var displayListCalled = false
    var displayErrorCalled = false
    
    init(dogsPicturesTable: UITableView, picturesArray: [PicturesViewModel]) {
        self.dogsPicturesTable = dogsPicturesTable
        self.picturesArray = picturesArray
    }
    
    func displayList(_ list: [PicturesViewModel]) {
        displayListCalled = true
    }
    
    func displayError() {
        displayErrorCalled = true
    }
}
