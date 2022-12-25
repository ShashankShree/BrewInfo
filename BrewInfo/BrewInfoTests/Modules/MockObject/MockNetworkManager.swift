//
//  MockNetworkManager.swift
//  BrewInfoTests
//
//  Created by Shashank Shree on 21/12/22.
//

import Foundation
@testable import BrewInfo

class MockNetworkManager: INetworkManager {
    
    var brewList: [BrewDataListDTO]?
    var error: Error?
    
    func request<T>(fromUrl url: URL, completion: @escaping Response<T>) where T : Decodable {
        if let _ = error {
            completion(.failure(NetworkError.failed))
        } else if let brewList = brewList {
            completion(.success(brewList as! T))
        }
    }
}
