//
//  MockData.swift
//  BrewInfoTests
//
//  Created by Shashank Shree on 21/12/22.
//

import Foundation
@testable import BrewInfo

final class MockData {
    
    static var brews: [BrewDataListDTO] {
        try! JSONDecoder().decode([BrewDataListDTO].self, from: brewInfoData)
    }
    
    static var domainBrews: [BrewDomainListDTO] {
        return brews.map { $0.toDmoain() }
    }
    
    static var brewList: [BrewItem] {
        return domainBrews.map { $0.toPresentation() }
    }
    
    static var brewItem: BrewItem {
        return brewList.first!
    }
    
    static var brewInfoData: Data {
        loadJsonData("BrewInfo")
    }
    
    static func loadJsonData(_ fromFile: String) -> Data {
        let path = Bundle(for: self).path(forResource: fromFile, ofType: "json")
        let jsonString = try! String(contentsOfFile: path!, encoding: .utf8)
        let data = jsonString.data(using: .utf8)!
        return data
    }
}
