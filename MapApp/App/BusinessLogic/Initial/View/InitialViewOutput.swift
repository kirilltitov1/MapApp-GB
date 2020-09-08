//
//  InitialInitialViewOutput.swift
//  MapApp-GB
//
//  Created by kirill on 01/09/2020.
//  Copyright © 2020 nil. All rights reserved.
//

protocol InitialViewOutput {

	// Camera
	func switchCameraFollow()
	func zoomIn()
	func zoomOut()

    func viewIsReady()
}
