import UIKit

class BreedsListViewDelegate: NSObject {
    weak var view: BreedsListViewController?
}

extension BreedsListViewDelegate: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let view = view else {
            return
        }
        let vcDogsPictures = DogsPicturesViewController(
            viewDataSource: DogPicturesViewDataSource(),
            viewDelegate: DogPicturesViewDelegate()
        )
        let cellContent = view.breedsArray[indexPath.row]
        vcDogsPictures.dogBreed = cellContent.name
        
        let getPicturesListUseCase = DogCeoServiceLocator().getPicturesListUseCase
        vcDogsPictures.getPicturesListUseCase = getPicturesListUseCase
        
        view.navigationController?.pushViewController(vcDogsPictures, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
