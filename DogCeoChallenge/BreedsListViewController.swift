//
//  ViewController.swift
//  DogCeoChallenge
//
//  Created by Mobdev on 20-04-22.
//

import UIKit

class BreedsListViewController: UIViewController {
    
    private let breedsListTable = UITableView()
    var breedsArray: [String] = []
    var dogRepository: DogRepository?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "DOG BREEDS"
        
        prepareTableView()
        prepareTableViewDelegates()
        
        dogRepository?.fetchDogBreeds(onCompletion: { breeds, error in
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
        breedsListTable.dataSource = self
        breedsListTable.delegate = self
    }
    
}

extension BreedsListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return breedsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = breedsListTable.dequeueReusableCell(withIdentifier: "cell") as! BreedsListTableViewCell
        let cellContent = breedsArray[indexPath.row]
        cell.breedLabel.text = cellContent
        return cell
    }
}

extension BreedsListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vcDogsPictures = DogsPicturesViewController()
        let cellContent = breedsArray[indexPath.row]
        vcDogsPictures.dogBreed = cellContent
        vcDogsPictures.restApiCall = APICall()
        navigationController?.pushViewController(vcDogsPictures, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
