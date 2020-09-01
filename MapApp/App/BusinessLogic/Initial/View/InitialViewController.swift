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

		configurateMap()
        output.viewIsReady()
    }

    // MARK: InitialViewInput
    func setupInitialState() {
    }
}

// MARK: - GOOGLE MAPS
extension InitialViewController: GMSMapViewDelegate {

	public func addMarker(toCoordinate coordinate: CLLocationCoordinate2D?) {
		guard let coordinate = coordinate else { return }
		let marker = GMSMarker(position: coordinate)
		marker.map = mapView
	}

	public func updateCameraPosition(withLocation location: CLLocationCoordinate2D?) {
		guard let location = location else { return }

		mapView.animate(toLocation: location)
	}

	func configurateMap() {
		mapView.delegate = self
		mapView.animate(toZoom: 13)
		mapView.mapType = .satellite
	}
}
