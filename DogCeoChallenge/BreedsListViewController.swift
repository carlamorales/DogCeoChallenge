//
//  ViewController.swift
//  DogCeoChallenge
//
//  Created by Mobdev on 20-04-22.
//

import UIKit

class BreedsListViewController: UIViewController {
    
    let breedsListTable = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "DOG BREEDS"
        
        view.addSubview(breedsListTable)
        breedsListTable.pin(to: view)
        
        breedsListTable.dataSource = self
        breedsListTable.delegate = self
    }

}

extension BreedsListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
}

extension BreedsListViewController: UITableViewDelegate {}
