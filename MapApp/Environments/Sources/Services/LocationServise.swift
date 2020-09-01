//
//  LocationServise.swift
//  MapApp
//
//  Created by Кирилл Титов on 01.09.2020.
//  Copyright © 2020 Кирилл Титов. All rights reserved.
//

import Foundation
import CoreLocation

protocol LocationServiceInterface {
	func setup()
}

extension LocationServiceInterface {
	func setup() {}
}

class LocationService: LocationServiceInterface {
	
}
