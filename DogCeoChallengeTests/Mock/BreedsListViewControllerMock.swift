import UIKit
@testable import DogCeoChallenge

class BreedsListViewControllerMock: BreedsListViewController {
    var viewDataSourceMock: BreedsListViewDataSource?
    var viewDelegateMock: BreedsListViewDelegate?
    
    let breedsListTableMock = UITableView()
    
    override func viewDidLoad() {
        breedsListTableMock.dataSource = viewDataSourceMock
        breedsListTableMock.delegate = viewDelegateMock
        
        prepareTableView()
    }
    
    private func prepareTableView() {
        view.addSubview(breedsListTableMock)
        breedsListTableMock.pin(to: view)
        breedsListTableMock.register(BreedsListTableViewCell.self, forCellReuseIdentifier: "cell")
        title = "DOG BREEDS"
    }
}
