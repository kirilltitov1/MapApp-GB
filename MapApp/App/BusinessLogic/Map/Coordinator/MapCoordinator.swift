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

        // MARK: MODELS
		let location = LocationModel()

		let mapViewModel = MapViewModel(location: location)
        mapViewController.viewModel = mapViewModel

        // Coordinator subscribes to events and notifies parentCoordinator

        self.navigationController.viewControllers = [mapViewController]
	}
}
