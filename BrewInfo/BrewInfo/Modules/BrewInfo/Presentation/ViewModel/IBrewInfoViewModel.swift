//
//  IBrewInfoViewModel.swift
//  BrewInfo
//
//  Created by Shashank Shree on 21/12/22.
//

import Foundation

// MARK: BrewInfoViewModel Protocol

protocol IBrewInfoViewModel {
    var brewInfo: [BrewInfoCellViewModel] { get set }
    func fetchBrewInfo()
    func getBrewItemforID(id: Int)-> BrewItem?
    var outputDelegate: BrewInfoViewModelOutput? { get set }
}

// MARK: CallbackStatus Protocol

protocol BrewInfoViewModelOutput: AnyObject {
    func handleSuccess()
    func handleFailure(_ message: String)
}
