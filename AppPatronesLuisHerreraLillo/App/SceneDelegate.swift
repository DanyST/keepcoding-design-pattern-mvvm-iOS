//
//  SceneDelegate.swift
//  AppPatronesLuisHerreraLillo
//
//  Created by Luis Eduardo Herrera Lillo on 07-10-23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        
        let navigation = UINavigationController()
        let splashViewModel = SplashViewModel()
        let splashViewController = SplashViewController(viewModel: splashViewModel)
        splashViewModel.viewDelegate = splashViewController
        
        navigation.setViewControllers([splashViewController], animated: true)
        
        window.rootViewController = navigation
        window.makeKeyAndVisible()
        self.window = window
    }
}

