//
//  AddEventCoordinator.swift
//  EventsApp
//
//  Created by Saulo Garcia on 9/23/20.
//

import UIKit

final class AddEventCoordinator: Coordinator {
    private(set) var childCoordinators: [Coordinator] = []
    var parentCoordinator: EventListCoordinator?
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        // create add event view controller
        let addEventViewController: AddEventViewController = .instantiate()
        // create add event VM
        let addEventViewModel = AddEventViewModel()
        addEventViewModel.coordinator = self
        addEventViewController.viewModel = addEventViewModel
        // present modally controller using navigation controller
        navigationController.present(addEventViewController, animated: true, completion: nil)
        
    }
    
    func didFinishAddEvent() {
        parentCoordinator?.childDidFinish(self)
    }
    
    deinit {
        print("deinit from AddEventCoordinator")
    }
    
}
