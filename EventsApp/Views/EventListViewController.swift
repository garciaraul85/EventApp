//
//  EventListViewController.swift
//  EventsApp
//
//  Created by Saulo Garcia on 9/22/20.
//

import UIKit
//import CoreData

class EventListViewController: UIViewController {
    
//    private let coreDataManager = CoreDataManager()
    var viewModel: EventListViewModel!
    
    static func instantiate() -> EventListViewController {
        let storyBoard = UIStoryboard(name: "Main", bundle: .main)
        let controller = storyBoard.instantiateViewController(identifier: "EventListViewController") as! EventListViewController
        return controller
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        
        // Test CoreDataManager
//        coreDataManager.saveEvent(name: "New Years", date: Date(), image: #imageLiteral(resourceName: "NewYears"))
//        print(coreDataManager.fetchEvents())
    }
    
    private func setupViews() {
        let plusImage = UIImage(systemName: "plus.circle.fill")
        // set button style and listener
        let barButtonItem = UIBarButtonItem(image: plusImage, style: .plain, target: self, action: #selector(tappedAddEventButton))
        
        barButtonItem.tintColor = .primary
        navigationItem.rightBarButtonItem = barButtonItem
        navigationItem.title = viewModel.title
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    @objc private func tappedAddEventButton() {
        viewModel.tappedAddEvent()
    }
    
}
