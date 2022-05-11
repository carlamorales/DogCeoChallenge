class DogsPicturesPresenter: DogsPicturesPresenterProtocol {
    
    private let getPicturesListUseCase: GetPicturesListUseCase
    weak var view: DogsPicturesView?
    
    init(getPicturesListUseCase: GetPicturesListUseCase) {
        self.getPicturesListUseCase = getPicturesListUseCase
    }
    
    func getPicturesList(breed: String) {
        getPicturesListUseCase.execute(breed: breed) { [weak self] list, error in
            if let list = list {
                let pictures = list.message.map { PicturesViewModel(name: $0) }
                self?.view?.displayList(pictures)
            } else {
                self?.view?.displayError()
            }
        }
    }
}
