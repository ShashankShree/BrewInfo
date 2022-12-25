//
//  BrewDomainListDTO.swift
//  BrewInfo
//
//  Created by Shashank Shree on 21/12/22.
//

import Foundation

struct BrewDomainListDTO: Equatable {
    let name: String
    let tagLine: String
    let description: String
    let id: Int
    let imageUrl: String
}

extension BrewDomainListDTO {
    
    func toPresentation() -> BrewItem {
        return .init(
            name: name,
            tagLine: tagLine,
            description: description,
            id: id,
            imageUrl: imageUrl)
    }
}
