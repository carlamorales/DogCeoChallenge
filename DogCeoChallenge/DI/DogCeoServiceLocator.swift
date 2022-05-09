class DogCeoServiceLocator {
    private let restApi = AlamofireApiCall()
    private let breedsListToArrayMapper = BreedsListToArrayMapper()
    private let picturesListToArrayMapper = PicturesListToArrayMapper()
    
    private var repository: DogApiRepository {
        return DogApiRepository(
            restApi: restApi,
            breedsMapper: breedsListToArrayMapper,
            picturesMapper: picturesListToArrayMapper
        )
    }
    
    var getBreedsListUseCase: GetBreedsListUseCase {
        return GetBreedsListUseCase(dogRepository: repository)
    }
    
    var getPicturesListUseCase: GetPicturesListUseCase {
        return GetPicturesListUseCase(dogRepository: repository)
    }
}
