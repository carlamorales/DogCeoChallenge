//
//  DogsPicturesViewController.swift
//  DogCeoChallenge
//
//  Created by Mobdev on 21-04-22.
//

import UIKit

class DogsPicturesViewController: UIViewController {
    
    let dogsPicturesTable = UITableView()
    var picturesArray: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(dogsPicturesTable)
        dogsPicturesTable.pin(to: view)
        dogsPicturesTable.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        dogsPicturesTable.dataSource = self
        dogsPicturesTable.delegate = self
    }
    
}

extension DogsPicturesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
}

extension DogsPicturesViewController: UITableViewDelegate {}
