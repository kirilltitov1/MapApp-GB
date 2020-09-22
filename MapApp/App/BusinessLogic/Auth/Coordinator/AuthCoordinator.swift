//
//  AuthCoordinator.swift
//  MapApp
//
//  Created by Кирилл Титов on 07.09.2020.
//  Copyright © 2020 Кирилл Титов. All rights reserved.
//

import RxSwift

class AuthCoordinator: BaseCoordinator {

    private let disposeBag = DisposeBag()

    override func start() {
        let viewController = UIStoryboard.init(name: "Auth", bundle: nil).instantiateInitialViewController()
        guard let authViewController = viewController as? AuthViewController else { return }

        // Coordinator initializes and injects viewModel
        let authViewModel = AuthViewModel(authentication: AuthService())
        authViewController.viewModel = authViewModel

        // Coordinator subscribes to events and notifies parentCoordinator
        authViewModel.didSignIn
            .subscribe(onNext: { [weak self] in
                guard let self = self else { return }
                self.navigationController.viewControllers = []
                self.parentCoordinator?.didFinish(coordinator: self)
                (self.parentCoordinator as? AuthListener)?.didSignIn()
            })
            .disposed(by: self.disposeBag)

		// register
		let registerCoordinator = RegisterCoordinator()
		registerCoordinator.navigationController = self.navigationController

		authViewModel.didRegisterTapped
			.subscribe(onNext: { [weak self] in
				guard let self = self else { return }
				self.navigationController.setNavigationBarHidden(false, animated: true)
				self.start(coordinator: registerCoordinator)
			})
			.disposed(by: disposeBag)

        self.navigationController.viewControllers = [authViewController]
    }
}
