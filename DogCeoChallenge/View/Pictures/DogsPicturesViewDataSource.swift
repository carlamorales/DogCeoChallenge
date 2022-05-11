import UIKit

class DogsPicturesViewDataSource: NSObject {
    weak var view: DogsPicturesViewController?
}

extension DogsPicturesViewDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return view?.picturesArray.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let view = view else {
            return UITableViewCell()
        }
        let cell = view.dogsPicturesTable.dequeueReusableCell(withIdentifier: "cell") as! DogsPicturesTableViewCell
        let cellContent = view.picturesArray[indexPath.row]
        if let image = nsCache.object(forKey: cellContent as NSString) {
            cell.dogImageView.image = image
        } else {
            cell.dogImageView.downloaded(from: cellContent)
        }
        return cell
    }
}
