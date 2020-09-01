//
//  InitialInitialPresenter.swift
//  MapApp-GB
//
//  Created by kirill on 01/09/2020.
//  Copyright © 2020 nil. All rights reserved.
//

import CoreLocation

class InitialPresenter: InitialModuleInput, InitialViewOutput, InitialInteractorOutput {

    weak var view: InitialViewInput!
    var interactor: InitialInteractorInput!
    var router: InitialRouterInput!

	var currentLocation: CLLocationCoordinate2D? {
		didSet {
			view.updateCameraPosition(withLocation: currentLocation)
			view.addMarker(toCoordinate: currentLocation)
		}
	}

    func viewIsReady() {
		interactor.startUpdatingLocation()
    }
}
