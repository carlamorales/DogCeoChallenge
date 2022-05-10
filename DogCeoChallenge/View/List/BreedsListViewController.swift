import UIKit

class BreedsListViewController: UIViewController {
    
    var viewDataSource: BreedsListViewDataSource?
    var viewDelegate: BreedsListViewDelegate?
    
    let breedsListTable = UITableView()
    var breedsArray: [String] = []
    
    var getBreedsListUseCase: GetBreedsListUseCase?
    
    convenience init(viewDataSource: BreedsListViewDataSource, viewDelegate: BreedsListViewDelegate) {
        self.init()
        self.viewDataSource = viewDataSource
        self.viewDelegate = viewDelegate
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareTableView()
        prepareTableViewDelegates()
        
        getBreedsListUseCase?.execute(onCompletion: { breeds, error in
            DispatchQueue.main.async {
                guard let breeds = breeds else {
                    print(error?.description ?? "Error")
                    return
                }
                self.breedsArray = breeds.message
                self.breedsListTable.reloadData()
            }
        })
        
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
