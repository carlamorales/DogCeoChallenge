import UIKit

class DogsPicturesViewController: UIViewController {
    
    private var viewDataSource: DogsPicturesViewDataSource?
    private var viewDelegate: DogsPicturesViewDelegate?
    private var presenter: DogsPicturesPresenterProtocol?
    
    let dogsPicturesTable = UITableView()
    var picturesArray: [PicturesViewModel] = []
    var dogBreed: String = ""
    
    convenience init(
        viewDataSource: DogsPicturesViewDataSource,
        viewDelegate: DogsPicturesViewDelegate,
        presenter: DogsPicturesPresenterProtocol
    ) {
        self.init()
        self.viewDataSource = viewDataSource
        self.viewDelegate = viewDelegate
        self.presenter = presenter
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareTableView()
        prepareTableViewDelegates()
        presenter?.getPicturesList(breed: dogBreed)
        
    }
    
    private func prepareTableView() {
        view.addSubview(dogsPicturesTable)
        dogsPicturesTable.pin(to: view)
        dogsPicturesTable.register(DogsPicturesTableViewCell.self, forCellReuseIdentifier: "cell")
        title = dogBreed.uppercased()
    }
    
    private func prepareTableViewDelegates() {
        dogsPicturesTable.dataSource = viewDataSource
        viewDataSource?.view = self
        dogsPicturesTable.delegate = viewDelegate
        viewDelegate?.view = self
    }
    
}

extension DogsPicturesViewController: DogsPicturesView {
    func displayList(_ list: [PicturesViewModel]) {
        picturesArray = list
        dogsPicturesTable.reloadData()
    }
    
    func displayError() {
        print("Error")
    }
}
