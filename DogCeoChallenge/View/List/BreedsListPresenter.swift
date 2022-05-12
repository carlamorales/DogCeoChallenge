class BreedsListPresenter: BreedsListPresenterProtocol {
    
    private let getBreedsListUseCase: GetBreedsListUseCase
    private let breedsMapper: Mapper<[BreedsViewModel], BreedsList>
    weak var view: BreedsListView?
    
    init(getBreedsListUseCase: GetBreedsListUseCase, breedsMapper: Mapper<[BreedsViewModel], BreedsList>) {
        self.getBreedsListUseCase = getBreedsListUseCase
        self.breedsMapper = breedsMapper
    }
    
    func getBreedsList() {
        getBreedsListUseCase.execute { [weak self] list, error in
            if let list = list {
                let breeds = self?.breedsMapper.reverseMap(value: list)
                self?.view?.displayList(breeds ?? [])
            } else {
                self?.view?.displayError()
            }
        }
    }
    
}
