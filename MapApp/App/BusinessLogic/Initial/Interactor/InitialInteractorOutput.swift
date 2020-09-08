//
//  InitialInitialInteractorOutput.swift
//  MapApp-GB
//
//  Created by kirill on 01/09/2020.
//  Copyright © 2020 nil. All rights reserved.
//

import Foundation
import CoreLocation

protocol InitialInteractorOutput: class {
	var currentLocation: CLLocationCoordinate2D? { get set }
}
