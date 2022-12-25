//
//  BrewRepository.swift
//  BrewInfo
//
//  Created by Shashank Shree on 21/12/22.
//

import Foundation

class BrewRepositoryImpl: IBrewRepository {
    
    private let service: IBrewService
    
    init(service: IBrewService) {
        self.service = service
    }
    
    func fetchBrewList(completion: @escaping DataResponse) {
        self.service.fetchBrewListFromNetwork {
            (result: Result<[BrewDataListDTO], Error>) in
            switch result {
            case .success(let brewList):
                completion(.success(brewList.map { $0.toDmoain() }))
            case .failure(_):
                completion(.failure(NetworkError.failed))
            }
        }
    }
}
