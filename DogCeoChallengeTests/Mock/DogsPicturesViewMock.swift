import UIKit
@testable import DogCeoChallenge

class DogsPicturesViewMock: DogsPicturesView {
    var dogsPicturesTable: UITableView
    var picturesArray: [PicturesViewModel]
    
    var displayListCalled = false
    var displayErrorCalled = false
    
    init(picturesArray: [PicturesViewModel], dogsPicturesTable: UITableView) {
        self.picturesArray = picturesArray
        self.dogsPicturesTable = dogsPicturesTable
    }
    
    func displayList(_ list: [PicturesViewModel]) {
        displayListCalled = true
    }
    
    func displayError() {
        displayErrorCalled = true
    }
}
