//
//  ViewController.swift
//  MapApp
//
//  Created by Кирилл Титов on 30.08.2020.
//  Copyright © 2020 Кирилл Титов. All rights reserved.
//

import UIKit
import GoogleMaps
import CoreLocation

class ViewController: UIViewController {

	@IBOutlet weak var mapView: GMSMapView!

	private var locationManager: CLLocationManager?

	override func viewDidLoad() {
		super.viewDidLoad()

		self.setupLocationManager()
	}

}

// MARK: CORE LOCATION
extension ViewController: CLLocationManagerDelegate {

	private func setupLocationManager() {
		locationManager = CLLocationManager()
		locationManager?.requestWhenInUseAuthorization()
	}

	func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {

	}
}
