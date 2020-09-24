//
//  AddEventViewController.swift
//  EventsApp
//
//  Created by Saulo Garcia on 9/23/20.
//

import UIKit

class AddEventViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var viewModel: AddEventViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setDataSource()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        viewModel.viewDidDisappear()
    }
    
    deinit {
        print("deinit AddEventViewController")
    }
}


extension AddEventViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellViewModel = viewModel.cell(for: indexPath)
        switch cellViewModel {
            case .titleSubtitle(let titleSubtitleViewModel):
                let cell = tableView.dequeueReusableCell(withIdentifier: "TitleSubtitleCell", for: indexPath) as! TitleSubtitleCell
                cell.update(with: titleSubtitleViewModel)
                return cell
            case .titleImage:
                return UITableViewCell()
        }
    }
    
    func setDataSource() {
        tableView.dataSource = self
    
    }

}
