//
//  DogDBRepository.swift
//  DogCeoChallenge
//
//  Created by Mobdev on 26-04-22.
//
/*
import Foundation

struct DBError {
    let message: String
}

protocol DBCallProtocol {
    func test(onCompletion: @escaping ([String]?, DBError?) -> Void)
}

class DBCall: DBCallProtocol {
    func test(onCompletion: @escaping ([String]?, DBError?) -> Void) {
        onCompletion(["Akita"], DBError(message: ""))
    }
}

class DogDBRepository: DogRepository {
    
    private let dbCall: DBCallProtocol
    
    init(dbCall: DBCallProtocol) {
        self.dbCall = dbCall
    }
    
    func fetchDogBreeds(onCompletion: @escaping (BreedsList?, DomainError?) -> Void) {
        dbCall.test { breeds, error in
            if let breeds = breeds {
                let list = BreedsList(message: breeds)
                onCompletion(list, nil)
            } else {
                let domainError = DomainError(description: error?.message ?? "Error Generico")
                onCompletion(nil, domainError)
            }
        }
    }

}
*/
