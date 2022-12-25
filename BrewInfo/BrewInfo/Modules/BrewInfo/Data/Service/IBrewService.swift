//
//  IBrewService.swift
//  BrewInfo
//
//  Created by Shashank Shree on 21/12/22.
//

import Foundation

protocol IBrewService {
    func fetchBrewListFromNetwork(completion: @escaping (Result<[BrewDataListDTO], Error>) -> Void)
}
