//
//  BaseCoordinator.swift
//  MapApp
//
//  Created by Кирилл Титов on 07.09.2020.
//  Copyright © 2020 Кирилл Титов. All rights reserved.
//

import RxSwift

protocol Coordinator: AnyObject {
    var navigationController: UINavigationController { get set }
    var parentCoordinator: Coordinator? { get set }

    func start()
    func start(coordinator: Coordinator)
    func didFinish(coordinator: Coordinator)
}

class BaseCoordinator: Coordinator {

    var childCoordinators: [Coordinator] = []
    var parentCoordinator: Coordinator?
    var navigationController = UINavigationController()

    func start() {
        fatalError("Start method must be implemented")
    }

    func start(coordinator: Coordinator) {
        self.childCoordinators.append(coordinator)
        coordinator.parentCoordinator = self
        coordinator.start()
    }

    func didFinish(coordinator: Coordinator) {
        if let index = self.childCoordinators.firstIndex(where: { $0 === coordinator }) {
            self.childCoordinators.remove(at: index)
        }
    }
}
