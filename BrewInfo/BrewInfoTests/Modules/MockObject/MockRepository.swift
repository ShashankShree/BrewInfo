//
//  MockRepository.swift
//  BrewInfoTests
//
//  Created by Shashank Shree on 21/12/22.
//

import Foundation
@testable import BrewInfo

class MockBrewRepository: IBrewRepository {
    
    var brewList: [BrewDomainListDTO]?
    var error: Error?
    
    func fetchBrewList(completion: @escaping DataResponse) {
        if let _ = error {
            completion(.failure(NetworkError.failed))
        } else if let brewList = brewList {
            completion(.success(brewList))
        }
    }
}
