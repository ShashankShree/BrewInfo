//
//  IBrewRepository.swift
//  BrewInfo
//
//  Created by Shashank Shree on 21/12/22.
//

import Foundation
typealias DataResponse = (Result<[BrewDomainListDTO], Error>) -> Void

protocol IBrewRepository {
    func fetchBrewList(completion: @escaping DataResponse)
}
