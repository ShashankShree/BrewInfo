//
//  BrewListViewController.swift
//  BrewInfo
//
//  Created by Shashank Shree on 21/12/22.
//

import UIKit

final class BrewListViewController: UIViewController {
    
    // MARK: IBOutlets

    @IBOutlet private weak var tableView: UITableView!
    private let brewTableViewCell: IdentifierName = "brewTableViewCellIdentifier"

    // MARK: Variables
    
    var viewModel: IBrewInfoViewModel?
        
    // MARK: Object Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.accessibilityIdentifier = BrewModuleConstant.brewListAccessbiliy
        viewModel?.fetchBrewInfo()
    }
}

extension BrewListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.brewInfo.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: brewTableViewCell, for: indexPath) as? BrewTableViewCell, let brewInfo = viewModel?.brewInfo else {
            fatalError()
        }

        cell.configure(viewModel: brewInfo[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let item = viewModel?.getBrewItemforID(id: indexPath.row) else {return}
        BrewModuleRouter().goToDetailViewController(brewItem: item, view: self)
    }
}


extension BrewListViewController: BrewInfoViewModelOutput {
    
    func handleSuccess() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func handleFailure(_ message: String) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: NSLocalizedString(BrewModuleConstant.alertTitle, comment: ""), message: message, preferredStyle: .alert)
            alert.addAction( UIAlertAction(title: NSLocalizedString(BrewModuleConstant.okTitle, comment: ""), style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
}
