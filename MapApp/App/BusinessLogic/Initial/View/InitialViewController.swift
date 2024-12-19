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

	@IBOutlet weak var mapView: GMSMapView!

	@IBAction func compassPrerssed(_ sender: Any) {
		output.switchCameraFollow()
	}

	@IBAction func plusPressed(_ sender: Any) {
		output.zoomIn()
	}

	@IBAction func minusPressed(_ sender: Any) {
		output.zoomOut()
	}

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

	private func configurateMap() {
		mapView.delegate = self
		mapView.animate(toZoom: 13)
		mapView.mapType = .satellite
	}

	// Camera
	public func cameraFollow(withLocation loction: CLLocationCoordinate2D?) {
		guard let loction = loction else { return }
		mapView.animate(toLocation: loction)
	}

	public func updateCameraPosition(withLocation location: CLLocationCoordinate2D?) {
		guard let location = location else { return }

		mapView.animate(toLocation: location)
	}

	public func zoomCamera(byNumber number: Float) {
		mapView.animate(toZoom: number)
	}

	// Marker
	public func addMarker(toCoordinate coordinate: CLLocationCoordinate2D?) {
		guard let coordinate = coordinate else { return }
		let marker = GMSMarker(position: coordinate)
		marker.map = mapView
	}
}
