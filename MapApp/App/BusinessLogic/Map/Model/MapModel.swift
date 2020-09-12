//
//  MapModel.swift
//  MapApp
//
//  Created by Кирилл Титов on 08.09.2020.
//  Copyright © 2020 Кирилл Титов. All rights reserved.
//

import Foundation
import GoogleMaps
import CoreLocation
import RxSwift

class MapModel {

}

protocol Compass {
}

class CompassModel: Compass {

}

// MARK: LOCATION
protocol Location: CLLocationManagerDelegate {
	var didUpdateLocation: BehaviorSubject<CLLocation> { get }

	func startUpdatingLocation()
	func stopUpdatingLocation()
}

class LocationModel: NSObject, Location {
	private var locationManager: CLLocationManager!

	public var didUpdateLocation = BehaviorSubject<CLLocation>(value: CLLocation())

	override init() {
		super.init()

		self.configurateLocationManager()
	}

	private func configurateLocationManager() {
		locationManager = CLLocationManager()
		locationManager.delegate = self
		locationManager.requestWhenInUseAuthorization()
		self.startUpdatingLocation()
	}

	func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
		guard let updateLocation = locations.first else { return }
		print("\nlocation manager 'didUpdateLocations'")
		didUpdateLocation.onNext(updateLocation)
	}

	public func startUpdatingLocation() {
		locationManager.startUpdatingLocation()
	}

	public func stopUpdatingLocation() {
		locationManager.stopUpdatingLocation()
	}
}
