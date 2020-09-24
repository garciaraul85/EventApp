//
//  AddEventViewModel.swift
//  EventsApp
//
//  Created by Saulo Garcia on 9/23/20.
//

import UIKit

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

final class TitleSubtitleCell: UITableViewCell {
    private let titleLabel = UILabel()
    private let subtitleTextfield = UITextField()
    private let verticalStackView = UIStackView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupHierarchy()
        setupLayout()
    }
    
    // This means we are not going to be using the storyboard
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(with viewModel: TitleSubtitleCellViewModel) {
        titleLabel.text = viewModel.title
        subtitleTextfield.text = viewModel.subtitle
        subtitleTextfield.placeholder = viewModel.placeHolder
    }
    
    private func setupViews() {
        verticalStackView.axis = .vertical
        titleLabel.font = .systemFont(ofSize: 22, weight: .medium)
        subtitleTextfield.font = .systemFont(ofSize: 20, weight: .medium)
    }
    
    private func setupHierarchy() {
        contentView.addSubview(verticalStackView)
        verticalStackView.addArrangedSubview(titleLabel)
        verticalStackView.addArrangedSubview(subtitleTextfield)
    }
    
    // Setup constraints
    private func setupLayout() {
        NSLayoutConstraint.activate([
            verticalStackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            verticalStackView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            verticalStackView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            verticalStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
