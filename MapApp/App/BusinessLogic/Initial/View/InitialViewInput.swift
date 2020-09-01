//
//  InitialInitialViewInput.swift
//  MapApp-GB
//
//  Created by kirill on 01/09/2020.
//  Copyright © 2020 nil. All rights reserved.
//
import CoreLocation

protocol InitialViewInput: class {

    /**
        @author kirill
        Setup initial state of the view
    */

    func setupInitialState()

	func updateCameraPosition(withLocation loction: CLLocationCoordinate2D?)
	func addMarker(toCoordinate coordinate: CLLocationCoordinate2D?)
}
