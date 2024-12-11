//
//  SceneDelegate.swift
//  App
//
//  Created by Ibrahim Mo Gedami on 10/21/23.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    private var coordinator = NavigationCoordinator()
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        let rootView = AppCoordinatorView()
            .environmentObject(coordinator)
        window.rootViewController = UIHostingController(rootView: rootView)
        self.window = window
        window.makeKeyAndVisible()
//        guard let windowScene = scene as? UIWindowScene else { return }
//        let window = UIWindow(windowScene: windowScene)
//        let contentView = ExpandableSearchBarView()
//        window.rootViewController = UIHostingController(rootView: contentView)
//        self.window = window
//        window.makeKeyAndVisible()
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
    }
    
}

