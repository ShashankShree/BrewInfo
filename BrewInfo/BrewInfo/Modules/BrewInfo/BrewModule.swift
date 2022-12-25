//
//  BrewModule.swift
//  BrewInfo
//
//  Created by Shashank Shree on 21/12/22.
//

import Foundation
import UIKit

class BrewModule {
    
    private let networkManager: INetworkManager
    
    init(networkManager: INetworkManager) {
        self.networkManager = networkManager
    }
    
    func generateViewController() -> UIViewController? {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "brewListViewController") as? BrewListViewController  else {
            fatalError()
        }
        viewController.viewModel = generateBrewViewModel()
        viewController.viewModel?.outputDelegate = viewController
        return viewController
    }
    
    private func generateBrewViewModel() -> IBrewInfoViewModel {
        let viewModel = BrewInfoViewModelImpl(useCase: generateBrewUseCase())
        return viewModel
    }
    
    private func generateBrewUseCase() -> IBrewUseCase {
        let useCase = BrewUseCaseImpl(respository: generateBrewRepository())
        return useCase
    }
    
    private func generateBrewRepository() -> IBrewRepository {
        let repository = BrewRepositoryImpl(service: createBrewService())
        return repository
    }
    
    private func createBrewService() -> IBrewService {
        let service = BrewServiceImpl(networkManager: networkManager)
        return service
    }
}

class BrewDetailModule {
    
    func generateDetailViewController(brewItem: BrewItem) -> UIViewController? {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "brewDetailViewController") as? BrewDetailViewController  else {
            fatalError()
        }
        viewController.viewModel = BrewInfoDetailViewModelImpl(item: brewItem)
        return viewController
    }
}
