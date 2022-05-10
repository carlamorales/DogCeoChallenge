import UIKit

class BreedsListViewController: UIViewController {
    
    var viewDataSource = BreedsListViewDataSource()
    var viewDelegate = BreedsListViewDelegate()
    
    let breedsListTable = UITableView()
    var breedsArray: [String] = []
    
    var getBreedsListUseCase: GetBreedsListUseCase?
    
    convenience init(viewDataSource: BreedsListViewDataSource) {
        self.init()
        self.viewDataSource = viewDataSource
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "DOG BREEDS"
        
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
    }
    
    private func prepareTableViewDelegates() {
        breedsListTable.dataSource = viewDataSource
        viewDataSource.view = self
        breedsListTable.delegate = viewDelegate
        viewDelegate.view = self
    }
    
}
