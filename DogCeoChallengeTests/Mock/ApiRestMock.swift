@testable import DogCeoChallenge

class ApiRestMock: ApiRest {
    
    var shouldFail = false
    
    func fetchApiData(onCompletion: @escaping ([String]?, APIError?) -> Void) {
        if shouldFail {
            onCompletion(nil, APIError(errorMessage: ""))
        } else {
            onCompletion([""], nil)
        }
    }
    
    func fetchApiPictures(breed: String, onCompletion: @escaping ([String]?, APIError?) -> Void) {
        if shouldFail {
            onCompletion(nil, APIError(errorMessage: ""))
        } else {
            onCompletion([""], nil)
        }
    }
}
