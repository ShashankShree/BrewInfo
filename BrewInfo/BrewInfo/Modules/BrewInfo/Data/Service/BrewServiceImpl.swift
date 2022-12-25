//
//  BrewService.swift
//  BrewInfo
//
//  Created by Shashank Shree on 21/12/22.
//

import Foundation

class BrewServiceImpl: IBrewService {
        
    private let networkManager: INetworkManager
    
    init(networkManager: INetworkManager) {
        self.networkManager = networkManager
    }

    func fetchBrewListFromNetwork(completion: @escaping (Result<[BrewDataListDTO], Error>) -> Void) {
        self.networkManager.request(fromUrl: Configuration.brewListUrl, completion: completion)
    }
}
