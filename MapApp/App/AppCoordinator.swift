//
//  AppCoordinator.swift
//  MapApp
//
//  Created by Кирилл Титов on 07.09.2020.
//  Copyright © 2020 Кирилл Титов. All rights reserved.
//

import RxSwift
import RealmSwift

class AppCoordinator: BaseCoordinator {

	var window: UIWindow!

	override func start(window: UIWindow) {
		self.window = window

        self.navigationController.navigationBar.isHidden = true
        self.window.rootViewController = self.navigationController
        self.window.makeKeyAndVisible()
		
		let realm = try! Realm()
		let user = User()
		user.email = "admin"
		user.password = "admin"
		
//		try! realm.write {
//		  realm.deleteAll()
//		}
		
		do {
			if (realm.objects(User.self).filter("email == 'admin'").first == nil) {
				try realm.write {
					realm.add(user)
					print("admin added")
				}
			}
		} catch let error {
			print(error)
		}

        let coordinator = AuthCoordinator()
        coordinator.navigationController = self.navigationController
        self.start(coordinator: coordinator)
    }
}

protocol AuthListener {
    func didSignIn()
}

extension AppCoordinator: AuthListener {
    func didSignIn() {
        print("Signed In")

		let coordinator = MapCoordinator()
		coordinator.navigationController = self.navigationController
		self.start(coordinator: coordinator)
    }
}

protocol RegistrationListener {
	func didRegister()
}

extension AppCoordinator: RegistrationListener {
	func didRegister() {
		print("Registred")

		let coordinator = AuthCoordinator()
		coordinator.navigationController = self.navigationController
		self.start(coordinator: coordinator)
	}
}
