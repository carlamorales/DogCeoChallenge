import Foundation
import Alamofire

class AlamofireApiCall: ApiRest {
    
    private let statusOK = 200...299
    
    func fetchApiData(onCompletion: @escaping ([String]?, APIError?) -> Void) {
        let url = "https://dog.ceo/api/breeds/list"
        AF.request(url, method: .get).validate(statusCode: statusOK).responseDecodable(of: BreedsList.self) { response in
            if let breedList = response.value?.message {
                onCompletion(breedList, nil)
            } else {
                onCompletion(nil, APIError(errorMessage: "Invalid model"))
            }
        }
    }
    
    func fetchApiPictures(breed: String, onCompletion: @escaping ([String]?, APIError?) -> Void) {
        let url = "https://dog.ceo/api/breed/\(breed)/images"
        AF.request(url, method: .get).validate(statusCode: statusOK).responseDecodable(of: PicturesList.self) { response in
            if let picturesList = response.value?.message {
                onCompletion(picturesList, nil)
            } else {
                onCompletion(nil, APIError(errorMessage: "Invalid model"))
            }
        }
    }
    
}
