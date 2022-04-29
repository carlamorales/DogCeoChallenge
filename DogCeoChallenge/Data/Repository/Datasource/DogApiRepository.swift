class DogApiRepository: DogRepository {
        
    private let restApi: ApiRest
    private let breedsMapper: Mapper<BreedsList, [String]>
    
    init(restApi: ApiRest, breedsMapper: Mapper<BreedsList, [String]>) {
        self.restApi = restApi
        self.breedsMapper = breedsMapper
    }
    
    func fetchDogBreeds(onCompletion: @escaping (BreedsList?, DomainError?) -> Void) {
        restApi.fetchApiData { breeds, error in
            if let breeds = breeds {
                let list = self.breedsMapper.reverseMap(value: breeds)
                onCompletion(list, nil)
            } else {
                let domainError = DomainError(description: error?.errorMessage ?? "Error Generico")
                onCompletion(nil, domainError)
            }
        }
    }
    
    func fetchDogPictures(breed: String, onCompletion: @escaping (PicturesList?, DomainError?) -> Void) {
        restApi.fetchApiPictures(breed: breed) { pictures, error in
            if let pictures = pictures {
                let list = PicturesList(message: pictures)
                onCompletion(list, nil)
            } else {
                let domainError = DomainError(description: error?.errorMessage ?? "Error Generico")
                onCompletion(nil, domainError)
            }
        }
    }
    
}
