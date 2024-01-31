//
//  SceneDelegate.swift
//  TableView_sozvon
//
//  Created by Arthur Sh on 29.01.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        
        let vc = ViewController()
        let nav = UINavigationController(rootViewController: vc)
        
        window?.rootViewController = nav
        window?.makeKeyAndVisible()
    }

}

