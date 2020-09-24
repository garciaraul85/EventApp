//
//  AddEventViewModel.swift
//  EventsApp
//
//  Created by Saulo Garcia on 9/23/20.
//

import UIKit

final class AddEventViewModel {
    
    var onUpdate: () -> Void = {}
    
    enum Cell {
        case titleSubtitle(TitleSubtitleCellViewModel)
        case titleImage
    }
    
    var coordinator: AddEventCoordinator?
    
    private(set) var cells: [AddEventViewModel.Cell] = []
    
    func numberOfRows() -> Int {
        return cells.count
    }
    
    // Load cells
    func viewDidLoad() {
        cells = [
            .titleSubtitle(TitleSubtitleCellViewModel(title: "Name", subtitle: "", placeHolder: "Add a name")),
            .titleSubtitle(TitleSubtitleCellViewModel(title: "Date", subtitle: "", placeHolder: "Select a date"))
        ]
        onUpdate()
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
