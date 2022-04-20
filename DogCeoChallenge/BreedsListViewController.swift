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
        breedsListTable.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        breedsListTable.dataSource = self
        breedsListTable.delegate = self
    }

}

extension BreedsListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = breedsListTable.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "CONTENIDO TEXTUAL DE LA CELDA"
        return cell
    }
    
}

extension BreedsListViewController: UITableViewDelegate {}
