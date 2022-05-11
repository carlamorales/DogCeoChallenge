class BreedsListPresenter: BreedsListPresenterProtocol {
    
    private let getBreedsListUseCase: GetBreedsListUseCase
    weak var view: BreedsListView?
    
    init(getBreedsListUseCase: GetBreedsListUseCase) {
        self.getBreedsListUseCase = getBreedsListUseCase
    }
    
    func getBreedsList() {
        getBreedsListUseCase.execute { [weak self] list, error in
            if let list = list {
                let breeds = list.message.map { BreedsViewModel(name: $0) }
                self?.view?.displayList(breeds)
            } else {
                self?.view?.displayError()
            }
        }
    }
    
}
