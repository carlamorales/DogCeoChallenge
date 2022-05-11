import UIKit

class BreedsListViewDelegate: NSObject {
    weak var view: BreedsListViewController?
}

extension BreedsListViewDelegate: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let view = view else {
            return
        }
        let presenter = DogsPicturesPresenter(
            getPicturesListUseCase: DogCeoServiceLocator().getPicturesListUseCase
        )
        let vcDogsPictures = DogsPicturesViewController(
            viewDataSource: DogsPicturesViewDataSource(),
            viewDelegate: DogsPicturesViewDelegate(),
            presenter: presenter
        )
        let cellContent = view.breedsArray[indexPath.row]
        vcDogsPictures.dogBreed = cellContent.name
        presenter.view = vcDogsPictures
        view.navigationController?.pushViewController(vcDogsPictures, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
