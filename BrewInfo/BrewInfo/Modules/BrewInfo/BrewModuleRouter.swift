//
//  BrewModuleRouter.swift
//  BrewInfo
//
//  Created by Shashank Shree on 06/01/23.
//

import Foundation
import UIKit

final class BrewModuleRouter {

    func goToDetailViewController(brewItem: BrewItem, view: UIViewController) {
        guard let module = BrewDetailModule().generateDetailViewController(brewItem: brewItem) else {return}
        view.navigationController?.pushViewController(module, animated: true)
    }
}
