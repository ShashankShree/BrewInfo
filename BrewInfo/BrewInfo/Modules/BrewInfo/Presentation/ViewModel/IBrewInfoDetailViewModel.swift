//
//  BrewInfoDetailViewModel.swift
//  BrewInfo
//
//  Created by Shashank Shree on 21/12/22.
//

import Foundation

// MARK: BrewInfoViewModel Protocol

protocol IBrewInfoDetailViewModel {
    init(item: BrewItem)
    func fetchBrewInfoforItem()-> BrewItem
}
