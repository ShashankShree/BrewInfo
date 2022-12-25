//
//  AppDIContainer.swift
//  BrewInfo
//
//  Created by Shashank Shree on 21/12/22.
//

import UIKit

class AppDIContainer {
    
    var networkManager: INetworkManager = {
        let networkManager = NetworkManager()
        return networkManager
    }()
    
    func load(on window: UIWindow?) {
        let module = BrewModule(networkManager: networkManager)
        if let viewController = module.generateViewController() {
            let navigationController = UINavigationController(rootViewController: viewController)
            window?.rootViewController = navigationController
            window?.makeKeyAndVisible()
        }
    }
}
