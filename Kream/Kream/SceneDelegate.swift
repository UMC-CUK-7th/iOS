//
//  SceneDelegate.swift
//  KREAM
//
//  Created by 류한비 on 10/7/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
               window = UIWindow(frame: windowScene.coordinateSpace.bounds)
               window?.windowScene = windowScene
               window?.rootViewController = LoginViewController()
               window?.makeKeyAndVisible()
    }

}
