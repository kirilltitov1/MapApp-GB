//
//  InitialInitialViewController.swift
//  MapApp-GB
//
//  Created by kirill on 01/09/2020.
//  Copyright © 2020 nil. All rights reserved.
//

import UIKit

class InitialViewController: UIViewController, InitialViewInput {

    var output: InitialViewOutput!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }

    // MARK: InitialViewInput
    func setupInitialState() {
    }
}

extension InitialViewController: CLLocationManagerDelegate {

	func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {

	}

	func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
		showAlert(message: "\(error)")
	}
}
