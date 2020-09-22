//
//  RegisterViewModel.swift
//  MapApp
//
//  Created by Кирилл Титов on 08.09.2020.
//  Copyright © 2020 Кирилл Титов. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class RegisterViewModel {
	private let disposeBag = DisposeBag()
	private let registration: Reg

	let emailAddress = BehaviorSubject(value: "")
	let password = BehaviorSubject(value: "")
	let repeatPassword = BehaviorSubject(value: "")
	let isRegisterActive: Observable<Bool>

	let didRegister = PublishSubject<Void>()
	let didFailRegister = PublishSubject<Error>()
	let didRegisterTapped = PublishSubject<Void>()

	init(registration: Reg) {
		self.registration = registration
		self.isRegisterActive = Observable
			.combineLatest(self.emailAddress, self.password, self.repeatPassword)
			.map { $0.0 != "" && $0.1 != "" && $0.2 != "" && ($0.1 == $0.2)}
	}

	func registerTapped() {
		do {
			self.registration.register(email: try emailAddress.value(),
									   password: try password.value())
				.map {_ in}
				.observeOn(MainScheduler.instance)
				.subscribe(onSuccess: { [weak self] _ in
					self?.didRegister.onNext(())
					}, onError: { [weak self] error in
						self?.didFailRegister.onNext(error)
				})
				.disposed(by: disposeBag)
		} catch let error {
			print(error)
		}
	}
}
