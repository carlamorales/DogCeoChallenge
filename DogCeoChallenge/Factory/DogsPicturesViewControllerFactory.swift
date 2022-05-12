class DogsPicturesViewControllerFactory {
    static private let serviceLocator = DogCeoServiceLocator()
    
    static func makeDogsPicturesViewController() -> DogsPicturesViewController {
        let presenter = DogsPicturesPresenter(
            getPicturesListUseCase: serviceLocator.getPicturesListUseCase,
            picturesMapper: PicturesViewModelToPicturesListMapper()
        )
        let dogsPicturesViewController = DogsPicturesViewController(
            viewDataSource: DogsPicturesViewDataSource(),
            viewDelegate: DogsPicturesViewDelegate(),
            presenter: presenter
        )
        presenter.view = dogsPicturesViewController
        return dogsPicturesViewController
    }
}
