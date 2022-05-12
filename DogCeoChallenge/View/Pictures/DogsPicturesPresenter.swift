class DogsPicturesPresenter: DogsPicturesPresenterProtocol {
    
    private let getPicturesListUseCase: GetPicturesListUseCase
    private let picturesMapper: Mapper<[PicturesViewModel], PicturesList>
    weak var view: DogsPicturesView?
    
    init(getPicturesListUseCase: GetPicturesListUseCase, picturesMapper: Mapper<[PicturesViewModel], PicturesList>) {
        self.getPicturesListUseCase = getPicturesListUseCase
        self.picturesMapper = picturesMapper
    }
    
    func getPicturesList(breed: String) {
        getPicturesListUseCase.execute(breed: breed) { [weak self] list, error in
            if let list = list {
                let pictures = self?.picturesMapper.reverseMap(value: list)
                self?.view?.displayList(pictures ?? [])
            } else {
                self?.view?.displayError()
            }
        }
    }
}
