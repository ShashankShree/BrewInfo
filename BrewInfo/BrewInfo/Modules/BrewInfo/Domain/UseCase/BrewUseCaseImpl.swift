//
//  BrewUseCase.swift
//  BrewInfo
//
//  Created by Shashank Shree on 21/12/22.
//

import Foundation

final class BrewUseCaseImpl: IBrewUseCase {
        
    private let respository: IBrewRepository
    
    init(respository: IBrewRepository) {
        self.respository = respository
    }
    
    func fetchBrewList(completion: @escaping DomainResponse) {
        return self.respository.fetchBrewList { (result: Result<[BrewDomainListDTO], Error>) in
            switch result {
            case .success(let brewList):
                completion(.success(brewList.map { $0.toPresentation() } ))
            case .failure(_):
                completion(.failure(NetworkError.failed))
            }
        }
    }
}
