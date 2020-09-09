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

class MapViewController: UIViewController {

	private let disposeBag = DisposeBag()

	var viewModel: MapModel!

	@IBOutlet weak var mapView: GMSMapView!
	@IBOutlet weak var compassButton: UIButton!
	@IBOutlet weak var minusButton: UIButton!
	@IBOutlet weak var plusButtob: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

	func setupBindings() {
		self.compassButton.rx.tap.bind { [weak self] self.viewModel. }
	}
}
