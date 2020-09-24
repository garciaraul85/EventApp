//
//  AddEventViewModel.swift
//  EventsApp
//
//  Created by Saulo Garcia on 9/23/20.
//

import UIKit

final class AddEventViewModel {
    enum Cell {
        case titleSubtitle(TitleSubtitleCellViewModel)
        case titleImage
    }
    
    var coordinator: AddEventCoordinator?
    
    private(set) var cells: [AddEventViewModel.Cell] = []
    
    func numberOfRows() -> Int {
        return cells.count
    }
    
    func viewDidDisappear() {
        coordinator?.didFinishAddEvent()
    }
    
    func cell(for indexPath: IndexPath) -> Cell {
        return cells[indexPath.row]
    }
    
    deinit {
        print("deinit AddEventViewModel")
    }
}
