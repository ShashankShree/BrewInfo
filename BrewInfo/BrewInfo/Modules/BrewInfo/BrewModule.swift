//
//  BrewModule.swift
//  BrewInfo
//
//  Created by Shashank Shree on 21/12/22.
//

import Foundation
import UIKit

typealias IdentifierName = String

final class BrewModule {
    
    private let networkManager: INetworkManager
    private let brewList: IdentifierName = "brewListViewController"

    init(networkManager: INetworkManager) {
        self.networkManager = networkManager
    }
    
    func generateViewController() -> UIViewController? {
        let storyboard = UIStoryboard(name: BrewModuleConstant.mainStoryboard, bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: brewList) as? BrewListViewController  else {
            fatalError()
        }
        viewController.viewModel = generateBrewViewModel()
        viewController.viewModel?.outputDelegate = viewController
        return viewController
    }
}

private extension BrewModule {
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

final class BrewDetailModule {
    private let brewDetail: IdentifierName = "brewDetailViewController"

    func generateDetailViewController(brewItem: BrewItem) -> UIViewController? {
        let storyboard = UIStoryboard(name: BrewModuleConstant.mainStoryboard, bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: brewDetail) as? BrewDetailViewController  else {
            fatalError()
        }
        viewController.viewModel = BrewInfoDetailViewModelImpl(item: brewItem)
        return viewController
    }
}
