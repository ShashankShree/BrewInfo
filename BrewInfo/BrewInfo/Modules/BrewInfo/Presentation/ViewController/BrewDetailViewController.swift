//
//  BrewDetailViewController.swift
//  BrewInfo
//
//  Created by Shashank Shree on 21/12/22.
//

import UIKit

final class BrewDetailViewController: UIViewController {
    @IBOutlet private weak var descriptionLbl: UILabel!
    @IBOutlet private weak var logoImg: CustomImageView!

    // MARK: Variables
    
    var viewModel: IBrewInfoDetailViewModel?
        
    // MARK: Object Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        descriptionLbl.text = viewModel?.fetchBrewInfoforItem()?.description
        logoImg.downloadImageFrom(urlString: viewModel?.fetchBrewInfoforItem()?.imageUrl ?? "", imageMode: .scaleAspectFit)
    }
}
