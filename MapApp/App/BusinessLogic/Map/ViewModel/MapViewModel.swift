//
//  MapViewModel.swift
//  MapApp
//
//  Created by Кирилл Титов on 08.09.2020.
//  Copyright © 2020 Кирилл Титов. All rights reserved.
//

import RxSwift
import CoreLocation

class MapViewModel {
	private let disposeBag = DisposeBag()
	private let location: Location?

	// MARK: STATES
	var currentLocation = BehaviorSubject<CLLocation>(value: CLLocation())
	
	var followingState = BehaviorSubject<Bool>(value: true)

	var currentZoom = BehaviorSubject<Float>(value: 10)

	/// MARK: EVENTS

	init(location: Location?) {
		self.location = location

		self.setUpBindings()
		self.startUpdatingLocation()
	}

	// MARK: ACTIONS
	func setUpBindings() {
		location?.didUpdateLocation
			.debug("")
			.bind(to: self.currentLocation)
			.disposed(by: disposeBag)
	}

	func changeFollowingMode() {
		do {
			self.followingState.onNext(!(try followingState.value()))
			print("\nfollowing mode = \(try followingState.value())")
		} catch let error {
			print(error)
		}
	}

	func zoomIn() {
		do {
			self.currentZoom.onNext(try self.currentZoom.value()-1)
		} catch let error {
			print(error)
		}
	}

	func zoomOut() {
		do {
			self.currentZoom.onNext(try self.currentZoom.value()+1)
		} catch let error {
			print(error)
		}
	}

//	func compassButtonTapped() {
//		print("\nin 🧭 'compassButtonTapped()'")
//		do {
//			let status = try compassStatus.value()
//			switch status {
//			case .active:
//				print(".active -> .inactive")
//				compassStatus.onNext(.inactive)
//				didCompassInactive.onNext(())
//			case .inactive:
//				print(".inactive -> .active")
//				compassStatus.onNext(.active)
//				didCompassActive.onNext(())
//			}
//		} catch let error {
//			print(error)
//		}
//	}

	func stopUpdatingLocation() {
		location?.stopUpdatingLocation()
	}

	func startUpdatingLocation() {
		location?.startUpdatingLocation()
	}

	deinit {
		stopUpdatingLocation()
	}
}
