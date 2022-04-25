//
//  ApiRest.swift
//  DogCeoChallenge
//
//  Created by Mobdev on 25-04-22.
//

import Foundation

protocol ApiRest: AnyObject {
    func fetchApiData(onCompletion: @escaping ([String]?, APIError?) -> Void)
    func fetchApiPictures(breed: String, onCompletion: @escaping ([String]?, APIError?) -> Void)
}
