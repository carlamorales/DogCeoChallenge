//
//  DogsPicturesViewController.swift
//  DogCeoChallenge
//
//  Created by Mobdev on 21-04-22.
//

import UIKit

class DogsPicturesViewController: UIViewController {
    
    private let dogsPicturesTable = UITableView()
    var picturesArray: [String] = []
    var dogBreed: String = ""
    var restApiCall: ApiRest?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = dogBreed.uppercased()
        
        prepareTableView()
        prepareTableViewDelegates()

        restApiCall?.fetchApiPictures(breed: dogBreed) { pictures, error in
            DispatchQueue.main.async {
                guard let pictures = pictures else {
                    print(error?.errorMessage ?? "Error")
                    return
                }
                self.picturesArray = pictures
                self.dogsPicturesTable.reloadData()
            }
        }
        
    }
    
    private func prepareTableView() {
        view.addSubview(dogsPicturesTable)
        dogsPicturesTable.pin(to: view)
        dogsPicturesTable.register(DogsPicturesTableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    private func prepareTableViewDelegates() {
        dogsPicturesTable.dataSource = self
        dogsPicturesTable.delegate = self
    }
    
}

extension DogsPicturesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return picturesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = dogsPicturesTable.dequeueReusableCell(withIdentifier: "cell") as! DogsPicturesTableViewCell
        let cellContent = picturesArray[indexPath.row]
        if let image = nsCache.object(forKey: cellContent as NSString) {
            cell.dogImageView.image = image
        } else {
            cell.dogImageView.downloaded(from: cellContent)
        }
        return cell
    }
}

extension DogsPicturesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}
