//
//  AddEventViewModel.swift
//  EventsApp
//
//  Created by Saulo Garcia on 9/23/20.
//

import Foundation

final class AddEventViewModel {
    var coordinator: AddEventCoordinator?
    
    enum Cell {
        case titleSubtitle(TitleSubtitleCellViewModel)
        case titleImage
    }
    
    func viewDidDisappear() {
        coordinator?.didFinishAddEvent()
    }
    
    deinit {
        print("deinit AddEventViewModel")
    }
}

final class TitleSubtitleCellViewModel {
    let title: String
    private(set) var subtitle: String
    let placeHolder: String
    
    init(title: String, subtitle: String, placeHolder: String) {
        self.title = title
        self.subtitle = subtitle
        self.placeHolder = placeHolder
    }
    
}
