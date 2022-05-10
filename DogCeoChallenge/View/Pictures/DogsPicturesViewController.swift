import UIKit

class DogsPicturesViewController: UIViewController {
    
    var viewDataSource: DogPicturesViewDataSource?
    var viewDelegate: DogPicturesViewDelegate?
    
    let dogsPicturesTable = UITableView()
    var picturesArray: [String] = []
    var dogBreed: String = ""
    
    var getPicturesListUseCase: GetPicturesListUseCase?
    
    convenience init(viewDataSource: DogPicturesViewDataSource, viewDelegate: DogPicturesViewDelegate) {
        self.init()
        self.viewDataSource = viewDataSource
        self.viewDelegate = viewDelegate
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareTableView()
        prepareTableViewDelegates()
        
        getPicturesListUseCase?.execute(breed: dogBreed, onCompletion: { pictures, error in
            DispatchQueue.main.async {
                guard let pictures = pictures else {
                    print(error?.description ?? "Error")
                    return
                }
                self.picturesArray = pictures.message
                self.dogsPicturesTable.reloadData()
            }
        })
        
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
