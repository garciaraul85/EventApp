//
//  AppCoordinator.swift
//  EventsApp
//
//  Created by Saulo Garcia on 9/22/20.
//

import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get } // Retain coordinators
    func start() // Entry point
}

final class AppCoordinator: Coordinator {
    private(set) var childCoordinators: [Coordinator] = []
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let navigationController = UINavigationController()
        
        let eventListCoordinator = EventListCoordinator(navigationController: navigationController)
        
        // Avoid dealocating eventListCoordinator
        childCoordinators.append(eventListCoordinator)
        
        eventListCoordinator.start()
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
}
