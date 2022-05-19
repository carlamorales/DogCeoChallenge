import UIKit

protocol DogsPicturesView: AnyObject {
    func displayList(_ list: [PicturesViewModel])
    func displayError()
    
    var picturesArray: [PicturesViewModel] { get set }
    var dogsPicturesTable: UITableView { get set }
}
