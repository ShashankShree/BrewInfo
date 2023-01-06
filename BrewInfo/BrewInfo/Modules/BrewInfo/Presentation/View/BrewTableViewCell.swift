//
//  BrewTableViewCell.swift
//  BrewInfo
//
//  Created by Shashank Shree on 21/12/22.
//

import UIKit

final class BrewTableViewCell: UITableViewCell {
        
    @IBOutlet private weak var lblTitle: UILabel!
    @IBOutlet private weak var lblTagLine: UILabel!
    @IBOutlet private weak var imgLogo: CustomImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configure(viewModel: BrewInfoCellViewModel) {
        lblTitle.text = viewModel.title
        lblTagLine.text = viewModel.tagLine
        imgLogo.downloadImageFrom(urlString: viewModel.imgLogo, imageMode: .scaleAspectFit)
    }
}
