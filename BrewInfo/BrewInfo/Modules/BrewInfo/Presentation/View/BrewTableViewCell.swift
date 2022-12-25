//
//  BrewTableViewCell.swift
//  BrewInfo
//
//  Created by Shashank Shree on 21/12/22.
//

import UIKit

class BrewTableViewCell: UITableViewCell {
        
    @IBOutlet private weak var lblTitle: UILabel!
        
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configure(viewModel: BrewInfoCellViewModel) {
        lblTitle.text = viewModel.title
    }
}
