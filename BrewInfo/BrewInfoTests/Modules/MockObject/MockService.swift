//
//  MockService.swift
//  BrewInfoTests
//
//  Created by Shashank Shree on 21/12/22.
//

import Foundation
@testable import BrewInfo

final class MockBrewService: IBrewService {
    
    var response: [BrewDataListDTO]?
    var error: Error?
    
    func fetchBrewListFromNetwork(completion: @escaping (Result<[BrewDataListDTO], Error>) -> Void) {
        if let error = error {
            return completion(.failure(error))
        }
        if let response = response {
            return completion(.success(response))
        }
    }
}
