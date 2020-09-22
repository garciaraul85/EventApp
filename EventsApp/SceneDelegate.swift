//
//  SceneDelegate.swift
//  EventsApp
//
//  Created by Saulo Garcia on 9/22/20.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var appCoordinator: AppCoordinator?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: scene)
        self.window = window
        
        // Allocate coordinator
        self.appCoordinator = AppCoordinator(window: window)
        self.appCoordinator?.start()
    }

}
