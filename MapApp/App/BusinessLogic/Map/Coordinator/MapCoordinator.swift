//
//  Map.swift
//  MapApp
//
//  Created by Кирилл Титов on 08.09.2020.
//  Copyright © 2020 Кирилл Титов. All rights reserved.
//

import Foundation
import UIKit

class MapCoordinator: BaseCoordinator {
	override func start() {
		let viewController = UIStoryboard.init(name: "Map", bundle: nil).instantiateInitialViewController()
        guard let mapViewController = viewController as? MapViewController else { return }

        // Coordinator initializes and injects viewModel
//        let mapViewModel = MapViewModel()
//        authViewController.viewModel = authViewModel

        // Coordinator subscribes to events and notifies parentCoordinator
//        authViewModel.didSignIn
//            .subscribe(onNext: { [weak self] in
//                guard let self = self else { return }
//                self.navigationController.viewControllers = []
//                self.parentCoordinator?.didFinish(coordinator: self)
//                (self.parentCoordinator as? AuthListener)?.didSignIn()
//            })
//            .disposed(by: self.disposeBag)

        self.navigationController.viewControllers = [mapViewController]
	}
}
