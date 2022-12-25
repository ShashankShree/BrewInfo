//
//  BrewDataListDTO.swift
//  BrewInfo
//
//  Created by Shashank Shree on 21/12/22.
//

import Foundation

struct BrewDataListDTO: Decodable {
    let name: String
    let tagLine: String
    let description: String
    let id: Int
    let imageUrl: String
    let firstBrewed: String
    
    private enum CodingKeys: String, CodingKey {
        case name
        case tagLine = "tagline"
        case description
        case id
        case imageUrl = "image_url"
        case firstBrewed = "first_brewed"
    }
}

extension BrewDataListDTO {

    func toDmoain() -> BrewDomainListDTO {
        return .init(
            name: name,
            tagLine: tagLine,
            description: description,
            id: id,
            imageUrl: imageUrl)
    }
}
