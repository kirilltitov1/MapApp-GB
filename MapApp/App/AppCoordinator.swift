//
//  AppCoordinator.swift
//  MapApp
//
//  Created by Кирилл Титов on 07.09.2020.
//  Copyright © 2020 Кирилл Титов. All rights reserved.
//

import RxSwift

class AppCoordinator: BaseCoordinator {

    var window = UIWindow(frame: UIScreen.main.bounds)

    override func start() {
        self.navigationController.navigationBar.isHidden = true
        self.window.rootViewController = self.navigationController
        self.window.makeKeyAndVisible()

        // TODO: here you could check if user is signed in and show appropriate screen
        let coordinator = AuthCoordinator()
        coordinator.navigationController = self.navigationController
        self.start(coordinator: coordinator)
    }
}

protocol SignInListener {
    func didSignIn()
}

extension AppCoordinator: SignInListener {
    func didSignIn() {
        print("Signed In")
        // TODO: Navigate to Dashboard
    }
}
