//
//  BrewListViewController.swift
//  BrewInfo
//
//  Created by Shashank Shree on 21/12/22.
//

import UIKit

class BrewListViewController: UIViewController {
    
    // MARK: IBOutlets

    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: Variables
    
    var viewModel: IBrewInfoViewModel?
        
    // MARK: Object Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()        
        viewModel?.fetchBrewInfo()
    }
    
    override func performSegue(withIdentifier identifier: String, sender: Any?) {
        self.performSegue(withIdentifier: "brewDetailViewController", sender: self)
    }
}

extension BrewListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.brewInfo.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "brewTableViewCellIdentifier", for: indexPath) as? BrewTableViewCell, let brewInfo = viewModel?.brewInfo else {
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
        guard let item = viewModel?.getBrewItemforID(id: indexPath.row), let module = BrewDetailModule().generateDetailViewController(brewItem: item) else {return}
        self.navigationController?.pushViewController(module, animated: false)
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
            let alert = UIAlertController(title: NSLocalizedString("alert", comment: ""), message: message, preferredStyle: .alert)
            alert.addAction( UIAlertAction(title: NSLocalizedString("ok", comment: ""), style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
}
