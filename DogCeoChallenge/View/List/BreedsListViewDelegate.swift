import UIKit

class BreedsListViewDelegate: NSObject {
    weak var view: BreedsListViewController?
}

extension BreedsListViewDelegate: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let view = view else {
            return
        }
        let cellContent = view.breedsArray[indexPath.row]
        let vcDogsPictures = DogsPicturesViewControllerFactory.makeDogsPicturesViewController()
        vcDogsPictures.dogBreed = cellContent.name
        view.navigationController?.pushViewController(vcDogsPictures, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
