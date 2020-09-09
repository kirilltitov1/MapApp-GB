//
//  MapViewModel.swift
//  MapApp
//
//  Created by Кирилл Титов on 08.09.2020.
//  Copyright © 2020 Кирилл Титов. All rights reserved.
//

import Foundation
import RxSwift

class MapViewModel {
	private let disposeBag = DisposeBag()

	

	let isCompassPressed: Observable<Bool>

	init() {
		self.isCompassPressed = Observable.compactMap {return false}
	}

	func compassButtonTapped() {
//
	}
	
}
