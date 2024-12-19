//
//  InitialInitialPresenter.swift
//  MapApp-GB
//
//  Created by kirill on 01/09/2020.
//  Copyright © 2020 nil. All rights reserved.
//

import CoreLocation

class InitialPresenter: InitialModuleInput, InitialViewOutput, InitialInteractorOutput {

    weak var view: InitialViewInput!
    var interactor: InitialInteractorInput!
    var router: InitialRouterInput!

	var isCameraFollow: Bool = false {
		didSet {
			if isCameraFollow {
				view.cameraFollow(withLocation: currentLocation)
			}
		}
	}

	var currentLocation: CLLocationCoordinate2D? {
		didSet {
			isCameraFollow = true
			view.addMarker(toCoordinate: currentLocation)
		}
	}

	var currentCameraZoom: Float = 10 {
		didSet {
			view.zoomCamera(byNumber: currentCameraZoom - oldValue)
		}
	}

	public func switchCameraFollow() {
		if isCameraFollow {
			isCameraFollow = false
		} else {
			isCameraFollow = true
		}
	}

	public func zoomIn() {
		currentCameraZoom += 1
	}

	public func zoomOut() {
		currentCameraZoom -= 1
	}

    func viewIsReady() {
		interactor.startUpdatingLocation()
    }
}
