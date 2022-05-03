import UIKit

class DogsPicturesViewController: UIViewController {
    
    private let dogsPicturesTable = UITableView()
    var picturesArray: [String] = []
    var dogBreed: String = ""
    //var dogRepository: DogRepository?
    
    var getPicturesListUseCase: GetPicturesListUseCase?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = dogBreed.uppercased()
        
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
