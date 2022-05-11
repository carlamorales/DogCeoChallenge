import UIKit

class BreedsListViewDataSource: NSObject {
    weak var view: BreedsListViewController?
}

extension BreedsListViewDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return view?.breedsArray.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let view = view else {
            return UITableViewCell()
        }
        let cell = view.breedsListTable.dequeueReusableCell(withIdentifier: "cell") as! BreedsListTableViewCell
        let cellContent = view.breedsArray[indexPath.row]
        cell.breedLabel.text = cellContent.name
        return cell
    }
}
