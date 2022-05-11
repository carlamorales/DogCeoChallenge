import UIKit

class BreedsListViewController: UIViewController {
    
    private var viewDataSource: BreedsListViewDataSource?
    private var viewDelegate: BreedsListViewDelegate?
    private var presenter: BreedsListPresenterProtocol?
    
    let breedsListTable = UITableView()
    var breedsArray: [BreedsViewModel] = []
    
    convenience init(
        viewDataSource: BreedsListViewDataSource,
        viewDelegate: BreedsListViewDelegate,
        presenter: BreedsListPresenterProtocol
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
        presenter?.getBreedsList()
    }
    
    private func prepareTableView() {
        view.addSubview(breedsListTable)
        breedsListTable.pin(to: view)
        breedsListTable.register(BreedsListTableViewCell.self, forCellReuseIdentifier: "cell")
        title = "DOG BREEDS"
    }
    
    private func prepareTableViewDelegates() {
        breedsListTable.dataSource = viewDataSource
        viewDataSource?.view = self
        breedsListTable.delegate = viewDelegate
        viewDelegate?.view = self
    }
    
}

extension BreedsListViewController: BreedsListView {
    func displayList(_ list: [BreedsViewModel]) {
        breedsArray = list
        breedsListTable.reloadData()
    }
    
    func displayError() {
        print("Error")
    }
}
