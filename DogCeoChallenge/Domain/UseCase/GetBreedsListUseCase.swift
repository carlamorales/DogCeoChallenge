struct GetBreedsListUseCase {
    private let dogRepository: DogRepository
    
    init(dogRepository: DogRepository) {
        self.dogRepository = dogRepository
    }
    
    func execute(onCompletion: @escaping (BreedsList?, DomainError?) -> Void) {
        dogRepository.fetchDogBreeds { breeds, error in
            onCompletion(breeds, error)
        }
    }
}
