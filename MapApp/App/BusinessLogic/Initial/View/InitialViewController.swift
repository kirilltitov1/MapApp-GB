//
//  InitialInitialViewController.swift
//  MapApp-GB
//
//  Created by kirill on 01/09/2020.
//  Copyright © 2020 nil. All rights reserved.
//

import UIKit
import CoreLocation
import GoogleMaps

class InitialViewController: UIViewController, InitialViewInput, showAlert {

    var output: InitialViewOutput!

//	var locationManager: CLLocationManager?

	@IBOutlet weak var mapView: GMSMapView!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        output.viewIsReady()
    }

    // MARK: InitialViewInput
    func setupInitialState() {
    }
}

// MARK: - GOOGLE MAPS
extension InitialViewController {

	public func addMarker(toCoordinate coordinate: CLLocationCoordinate2D) {
		let marker = GMSMarker(position: coordinate)
		marker.map = mapView
	}
}

// MARK: - CORE LOCATION
extension InitialViewController: CLLocationManagerDelegate {

	func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
		guard let updateCoordinate = locations.first?.coordinate else { return }
		updateCameraPosition(withLocation: updateCoordinate)
		addMarker(toCoordinate: updateCoordinate)
	}

	func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
		showAlert(message: "\(error)")
	}

	public func updateCameraPosition(withLocation loction: CLLocationCoordinate2D) {
		mapView.animate(toLocation: loction)
	}
}
