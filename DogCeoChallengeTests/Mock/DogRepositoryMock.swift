@testable import DogCeoChallenge

class DogRepositoryMock: DogRepository {
    
    var shouldFail = false
    
    func fetchDogBreeds(onCompletion: @escaping (BreedsList?, DomainError?) -> Void) {
        if shouldFail {
            onCompletion(nil, DomainError(description: ""))
        } else {
            onCompletion(BreedsList(message: [""]), nil)
        }
    }
    
    func fetchDogPictures(breed: String, onCompletion: @escaping (PicturesList?, DomainError?) -> Void) {
        if shouldFail {
            onCompletion(nil, DomainError(description: ""))
        } else {
            onCompletion(PicturesList(message: [""]), nil)
        }
    }
}
