class DogApiRepository: DogRepository {
    
    private let restApi: ApiRest
    
    init(restApi: ApiRest) {
        self.restApi = restApi
    }
    
    func fetchDogBreeds(onCompletion: @escaping (BreedsList?, DomainError?) -> Void) {
        restApi.fetchApiData { breeds, error in
            if let breeds = breeds {
                let list = BreedsList(message: breeds)
                onCompletion(list, nil)
            } else {
                let domainError = DomainError(description: error?.errorMessage ?? "Error Generico")
                onCompletion(nil, domainError)
            }
        }
    }
}
