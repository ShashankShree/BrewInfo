//
//  AppDIContainer.swift
//  BrewInfo
//
//  Created by Shashank Shree on 21/12/22.
//

import UIKit

final class AppDIContainer {
    
    func load(on window: UIWindow?) {
        let module = BrewModule(networkManager: NetworkManager.initObject)
        if let viewController = module.generateViewController() {
            let navigationController = UINavigationController(rootViewController: viewController)
            window?.rootViewController = navigationController
            window?.makeKeyAndVisible()
        }
    }
}
