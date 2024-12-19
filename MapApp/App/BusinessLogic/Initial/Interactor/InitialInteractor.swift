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

	private var locationManager: CLLocationManager?
}

// MARK: - LOCATION MANAGER
extension InitialInteractor: CLLocationManagerDelegate {
	func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
		output.currentLocation = locations.first?.coordinate
	}

	func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
		print(error)
	}

	func configurateLocationManager() {
		locationManager = CLLocationManager()
		locationManager?.delegate = self
		locationManager?.requestWhenInUseAuthorization()
	}

	func startUpdatingLocation() {
		configurateLocationManager()
		locationManager?.startUpdatingLocation()
	}

	func stopUpdatingLocation() {
		locationManager?.stopUpdatingLocation()
	}
}
