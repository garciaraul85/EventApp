//
//  EventListCoordinator.swift
//  EventsApp
//
//  Created by Saulo Garcia on 9/22/20.
//

import UIKit

final class EventListCoordinator: Coordinator {
    private(set) var childCoordinators: [Coordinator] = []
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        // Root of eventList
        let eventListViewController: EventListViewController = .instantiate()
        // Instantiate VM
        let eventListViewModel = EventListViewModel()
        // Bind coordinator to VM
        eventListViewModel.coordinator = self
        // Bind VM to Controller
        eventListViewController.viewModel = eventListViewModel
        navigationController.setViewControllers([eventListViewController], animated: false)
    }
    
    func startAddEvent() {
        let addEventCoordinator = AddEventCoordinator(navigationController: navigationController)
        childCoordinators.append(addEventCoordinator)
        addEventCoordinator.start()
    }
    
}
