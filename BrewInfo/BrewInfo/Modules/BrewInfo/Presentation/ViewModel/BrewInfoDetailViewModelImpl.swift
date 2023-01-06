//
//  BrewInfoDetailViewModel.swift
//  BrewInfo
//
//  Created by Shashank Shree on 21/12/22.
//

import Foundation

final class BrewInfoDetailViewModelImpl: IBrewInfoDetailViewModel {
    
    // MARK: Private Variables

    private var brewItem: BrewItem?
    
    // MARK: Object Lifecycle
    
    required init(item: BrewItem) {
        self.brewItem = item
    }
    
    // MARK: Protocol Functions
    
    func fetchBrewInfoforItem() -> BrewItem? {
        return brewItem ?? nil
    }
}
