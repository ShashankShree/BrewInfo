//
//  NetworkError.swift
//  BrewInfo
//
//  Created by Shashank Shree on 21/12/22.
//

import Foundation

enum NetworkError: Error {
    case badRequest
    case failed
    case noData
    case noResponse
    case unableToDecode
    
    var description: String {
        switch self {
        case .badRequest: return "Bad Request"
        case .failed: return "Network Request Failed"
        case .noData: return "Response returned with no data"
        case .noResponse: return "Response returned with no response"
        case .unableToDecode: return "Response couldnot be decoded"
        }
    }
}
