//
//  EventListViewModel.swift
//  EventsApp
//
//  Created by Saulo Garcia on 9/23/20.
//

import Foundation

final class EventListViewModel {
    let title = "Events"
    var coordinator: EventListCoordinator?
    
    func tappedAddEvent() {
        coordinator?.startAddEvent()
    }
}
