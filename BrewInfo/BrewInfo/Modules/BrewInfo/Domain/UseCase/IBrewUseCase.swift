//
//  IBrewUseCase.swift
//  BrewInfo
//
//  Created by Shashank Shree on 21/12/22.
//

import Foundation

typealias DomainResponse = (Result<[BrewItem], Error>) -> Void

protocol IBrewUseCase {
    func fetchBrewList(completion: @escaping DomainResponse)
}
