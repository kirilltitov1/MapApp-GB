//
//  InitialInitialInteractor.swift
//  MapApp-GB
//
//  Created by kirill on 01/09/2020.
//  Copyright © 2020 nil. All rights reserved.
//
import CoreLocation

class InitialInteractor: NSObject, InitialInteractorInput {

    weak var output: InitialInteractorOutput!

	var locationManager: CLLocationManager?
}

// MARK: - LOCATION MANAGER
extension InitialInteractor: CLLocationManagerDelegate {
	func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {

	}
}
