//
//  TitleSubtitleCellViewModel.swift
//  EventsApp
//
//  Created by Saulo Garcia on 9/23/20.
//

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
