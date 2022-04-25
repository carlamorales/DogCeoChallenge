//
//  APICall.swift
//  DogCeoChallenge
//
//  Created by Mobdev on 20-04-22.
//

import Foundation

struct BreedsList: Decodable {
    let message: [String]
}

struct PicturesList: Decodable {
    let message: [String]
}

struct APIError {
    let errorMessage: String
}

class APICall: ApiRest {
    
    private let urlSession: URLSession
    
    init(session: URLSession = URLSession.shared) {
        urlSession = session
    }
    
    func fetchApiData(onCompletion: @escaping ([String]?, APIError?) -> Void) {
        let url = URL(string: "https://dog.ceo/api/breeds/list")!
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = urlSession.dataTask(with: request) { data, response, error in
            if let data = data {
                if let breedsList = try? JSONDecoder().decode(BreedsList.self, from: data) {
                    onCompletion(breedsList.message, nil)
                } else {
                    onCompletion(nil, APIError(errorMessage: "Invalid model"))
                }
            } else {
                onCompletion(nil, APIError(errorMessage: "Invalid request"))
            }
        }
        task.resume()
    }
    
    func fetchApiPictures(breed: String, onCompletion: @escaping ([String]?, APIError?) -> Void) {
        let url = URL(string: "https://dog.ceo/api/breed/\(breed)/images")!
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = urlSession.dataTask(with: request) { data, response, error in
            if let data = data {
                if let picturesList = try? JSONDecoder().decode(PicturesList.self, from: data) {
                    onCompletion(picturesList.message, nil)
                } else {
                    onCompletion(nil, APIError(errorMessage: "Invalid model"))
                }
            } else {
                onCompletion(nil, APIError(errorMessage: "Invalid request"))
            }
        }
        task.resume()
    }
}
