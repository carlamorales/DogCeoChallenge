class BreedsListViewControllerFactory {
    static private let serviceLocator = DogCeoServiceLocator()
    
    static func makeBreedsListViewController() -> BreedsListViewController {
        let presenter = BreedsListPresenter(getBreedsListUseCase: serviceLocator.getBreedsListUseCase)
        let breedsListViewController = BreedsListViewController(
            viewDataSource: BreedsListViewDataSource(),
            viewDelegate: BreedsListViewDelegate(),
            presenter: presenter
        )
        presenter.view = breedsListViewController
        return breedsListViewController
    }
}
