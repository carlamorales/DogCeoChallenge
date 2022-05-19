import UIKit

class BreedsListViewDelegate: NSObject {
    weak var view: BreedsListView?
}

extension BreedsListViewDelegate: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let view = view else {
            return
        }
        let cellContent = view.breedsArray[indexPath.row]
        view.showNextViewController(name: cellContent.name)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
