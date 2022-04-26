protocol DogRepository {
    func fetchDogBreeds(onCompletion: @escaping (BreedsList?, DomainError?) -> Void)
}
