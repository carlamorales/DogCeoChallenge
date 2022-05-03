struct GetPicturesListUseCase {
    private let dogRepository: DogRepository
    
    init(dogRepository: DogRepository) {
        self.dogRepository = dogRepository
    }
    
    func execute(breed: String, onCompletion: @escaping (PicturesList?, DomainError?) -> Void) {
        dogRepository.fetchDogPictures(breed: breed) { pictures, error in
            onCompletion(pictures, error)
        }
    }
}
