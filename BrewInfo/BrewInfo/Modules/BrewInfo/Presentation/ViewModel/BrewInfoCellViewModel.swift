//
//  BrewInfoCellViewModel.swift
//  BrewInfo
//
//  Created by Shashank Shree on 21/12/22.
//

import Foundation
import UIKit

struct BrewInfoCellViewModel {
    let title: String
    let tagLine: String
    let imgLogo: String
    
    init(_ title: String, _ tagLine: String, _ imgLogo: String) {
        self.title = title
        self.tagLine = tagLine
        self.imgLogo = imgLogo
    }
}
