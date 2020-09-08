//
//  RegisterCoordinator.swift
//  MapApp
//
//  Created by Кирилл Титов on 08.09.2020.
//  Copyright © 2020 Кирилл Титов. All rights reserved.
//

import UIKit
import RxSwift

class RegisterCoordinator: BaseCoordinator {

	private let disposeBag = DisposeBag()

	override func start() {
		let viewController = UIStoryboard.init(name: "Register", bundle: nil).instantiateInitialViewController()
        guard let regViewController = viewController as? RegisterViewController else { return }

        // Coordinator initializes and injects viewModel
        let regViewModel = RegisterViewModel(registration: RegisterModel())
        regViewController.viewModel = regViewModel

		// Coordinator subscribes to events and notifies parentCoordinator
		regViewModel.didRegister.subscribe(onNext: { [weak self] in
			guard let self = self else { return }
			self.navigationController.viewControllers = []
			self.parentCoordinator?.didFinish(coordinator: self)
			(self.parentCoordinator as? RegistrationListener)?.didRegister()
		})
		.disposed(by: disposeBag)

		self.navigationController.viewControllers = [regViewController]
	}
}
