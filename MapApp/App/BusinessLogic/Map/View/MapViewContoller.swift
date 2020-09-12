//
//  MapView.swift
//  MapApp
//
//  Created by Кирилл Титов on 08.09.2020.
//  Copyright © 2020 Кирилл Титов. All rights reserved.
//

import UIKit
import GoogleMaps
import RxSwift
import RxCocoa
import CoreLocation

class MapViewController: UIViewController {

	private let disposeBag = DisposeBag()

	var viewModel: MapViewModel!

	@IBOutlet weak var mapView: GMSMapView!
	@IBOutlet weak var compassButton: UIButton!
	@IBOutlet weak var minusButton: UIButton!
	@IBOutlet weak var plusButtob: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
		
		self.setupBindings()
    }

	func setCamera(to location: CLLocation) {
		let coordinate = location.coordinate
		mapView.animate(toLocation: coordinate)
		print("\n'setCamera()'")
	}

	func setZoom(toZoom zoom: Float) {
		mapView.animate(toZoom: zoom)
	}

	func setupBindings() {
		self.compassButton.rx.tap
			.debug("🔲 button tapped")
			.bind { [weak self] in self?.viewModel.changeFollowingMode() }
			.disposed(by: disposeBag)
		self.viewModel.currentLocation
			.debug("♻️")
			.subscribe(onNext: { [weak self] location in
				guard let self = self else { return }
				do {
					if try self.viewModel.followingState.value() {
						self.setCamera(to: try self.viewModel.currentLocation.value())
					}
				} catch let error {
					print(error)
				}
			})
			.disposed(by: disposeBag)

		self.minusButton.rx.tap
			.debug()
			.bind { [weak self] in self?.viewModel.zoomIn() }
			.disposed(by: disposeBag)
		self.plusButtob.rx.tap
			.debug()
			.bind { [weak self] in self?.viewModel.zoomOut() }
			.disposed(by: disposeBag)
		self.viewModel.currentZoom.subscribe { currentZoom in
			guard let currentZoom = currentZoom.element else { return }
			self.setZoom(toZoom: currentZoom)
		}
		.disposed(by: disposeBag)
		
	}
}
