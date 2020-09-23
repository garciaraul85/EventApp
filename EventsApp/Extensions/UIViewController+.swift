//
//  UIViewController+.swift
//  EventsApp
//
//  Created by Saulo Garcia on 9/23/20.
//

import UIKit

extension UIViewController {
    
    static func instantiate<T>() -> T {
        let storyBoard = UIStoryboard(name: "Main", bundle: .main)
        let controller = storyBoard.instantiateViewController(identifier: "\(T.self)") as! T
        return controller
    }
    
}
