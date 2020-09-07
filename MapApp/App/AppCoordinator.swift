//
//  AppCoordinator2.swift
//  MapApp
//
//  Created by Кирилл Титов on 07.09.2020.
//  Copyright © 2020 Кирилл Титов. All rights reserved.
//

import RxSwift

protocol Coordinator: class {
	var childCoordinators : [Coordinator] { get set }
	func start() -> Observable<Void>
}

extension Coordinator {

    func add(coordinator: Coordinator) {
        childCoordinators.append(coordinator)
    }

    func remove(coordinator: Coordinator) {
        childCoordinators = childCoordinators.filter { $0 !== coordinator }
    }
}
