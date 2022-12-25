//
//  BrewDetailViewController.swift
//  BrewInfo
//
//  Created by Shashank Shree on 21/12/22.
//

import UIKit

class BrewDetailViewController: UIViewController {
    @IBOutlet private weak var descriptionLbl: UILabel!
    
    // MARK: Variables
    
    var viewModel: IBrewInfoDetailViewModel?
        
    // MARK: Object Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        descriptionLbl.text = viewModel?.fetchBrewInfoforItem().description
    }
}
