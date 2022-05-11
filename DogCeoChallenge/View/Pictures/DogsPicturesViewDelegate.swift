import UIKit

class DogsPicturesViewDelegate: NSObject {
    weak var view: DogsPicturesViewController?
}

extension DogsPicturesViewDelegate: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}
