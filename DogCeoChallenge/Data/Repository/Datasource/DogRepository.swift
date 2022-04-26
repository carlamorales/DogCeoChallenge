protocol DogRepository {
    func fetchDogBreeds(onCompletion: @escaping (BreedsList?, DomainError?) -> Void)
    func fetchDogPictures(breed: String, onCompletion: @escaping (PicturesList?, DomainError?) -> Void)
}
