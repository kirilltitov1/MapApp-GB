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

	var locationManager: CLLocationManager? {
		let locationManager = CLLocationManager()
		locationManager.requestWhenInUseAuthorization()
		locationManager.delegate = self
		return locationManager
	}
}

// MARK: - LOCATION MANAGER
extension InitialInteractor: CLLocationManagerDelegate {
	func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
		output.currentLocation = locations.first?.coordinate
	}

	func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {

	}

	func startUpdateLocation() {
		locationManager?.startUpdatingLocation()
	}

	func stopUpdateLocation() {
		locationManager?.stopUpdatingLocation()
	}
}
