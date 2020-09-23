//
//  AddEventViewModel.swift
//  EventsApp
//
//  Created by Saulo Garcia on 9/23/20.
//

import Foundation

final class AddEventViewModel {
    var coordinator: AddEventCoordinator?
    
    func viewDidDisappear() {
        coordinator?.didFinishAddEvent()
    }
    
    deinit {
        print("deinit AddEventViewModel")
    }
}
