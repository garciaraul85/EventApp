//
//  AddEventViewController.swift
//  EventsApp
//
//  Created by Saulo Garcia on 9/23/20.
//

import UIKit

class AddEventViewController: UIViewController {

    var viewModel: AddEventViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        viewModel.viewDidDisappear()
    }
    
    deinit {
        print("deinit AddEventViewController")
    }
}
