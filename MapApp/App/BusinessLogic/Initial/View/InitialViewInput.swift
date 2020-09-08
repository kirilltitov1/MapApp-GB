//
//  InitialInitialViewInput.swift
//  MapApp-GB
//
//  Created by kirill on 01/09/2020.
//  Copyright © 2020 nil. All rights reserved.
//
import CoreLocation

protocol InitialViewInput: class {

    func setupInitialState()

	// Camera
	func updateCameraPosition(withLocation loction: CLLocationCoordinate2D?)
	func cameraFollow(withLocation loction: CLLocationCoordinate2D?)
	func zoomCamera(byNumber number: Float)

	// Marker
	func addMarker(toCoordinate coordinate: CLLocationCoordinate2D?)
}
