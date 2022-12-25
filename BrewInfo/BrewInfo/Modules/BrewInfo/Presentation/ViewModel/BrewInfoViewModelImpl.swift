//
//  BrewInfoViewModelImpl.swift
//  BrewInfo
//
//  Created by Shashank Shree on 21/12/22.
//

import Foundation

class BrewInfoViewModelImpl: IBrewInfoViewModel {
    
    // MARK: Variables
    weak var outputDelegate: BrewInfoViewModelOutput?
    var brewInfo: [BrewInfoCellViewModel] = [BrewInfoCellViewModel]()
    
    // MARK: Private Variables
    private var brewList: [BrewItem]!
    private let useCase: IBrewUseCase
    
    // MARK: Object Lifecycle
    init(useCase: IBrewUseCase) {
        self.useCase = useCase
    }
    
    // MARK: Protocol Functions
    func fetchBrewInfo() {
        self.useCase.fetchBrewList { result in
            switch result {
            case let .success(brewList):
                self.brewList = brewList
                self.brewInfo = self.processFetchedBrewList(brewList)
                self.outputDelegate?.handleSuccess()
            case let .failure(error):
                self.outputDelegate?.handleFailure(error.localizedDescription)
            }
        }
    }
    
    func getBrewItemforID(id: Int)-> BrewItem {
        return self.brewList[id]
    }
    
    // MARK: Methods
    
    private func processFetchedBrewList(_ brewList: [BrewItem]) -> [BrewInfoCellViewModel] {
        var brewInfoCellViewModel = [BrewInfoCellViewModel]()
        for brew in brewList {
            let cellViewModel = BrewInfoCellViewModel(brew.tagLine)
            brewInfoCellViewModel.append(cellViewModel)
        }
        return brewInfoCellViewModel
    }
}
