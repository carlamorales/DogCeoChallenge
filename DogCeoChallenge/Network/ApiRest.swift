protocol ApiRest: AnyObject {
    func fetchApiData(onCompletion: @escaping ([String]?, APIError?) -> Void)
    func fetchApiPictures(breed: String, onCompletion: @escaping ([String]?, APIError?) -> Void)
}
