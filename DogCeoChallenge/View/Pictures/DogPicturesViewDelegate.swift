import UIKit

class DogPicturesViewDelegate: NSObject {
    weak var view: DogsPicturesViewController?
}

extension DogPicturesViewDelegate: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}
