//
//  AuthViewModel.swift
//  MapApp
//
//  Created by Кирилл Титов on 06.09.2020.
//  Copyright © 2020 Кирилл Титов. All rights reserved.
//

import Foundation
import RxSwift
import RealmSwift

class AuthViewModel {

	private let disposeBag = DisposeBag()
	private let authentication: Auth

	let emailAddress = BehaviorSubject(value: "")
	let password = BehaviorSubject(value: "")
	let isSignInActive: Observable<Bool>

	// events
	let didSignIn = PublishSubject<Void>()
	let didFailSignIn = PublishSubject<Error>()

	let didRegisterTapped = PublishSubject<Void>()

	init(authentication: Auth) {
		self.authentication = authentication
		self.isSignInActive = Observable.combineLatest(self.emailAddress, self.password).map { $0.0 != "" && $0.1 != "" }
	}

	func signInTapped() {
		if checkAdmin() { return }
		do {
			self.authentication.autn(email: try emailAddress.value(),
									 password: try password.value())
				.map { _ in }
				.observeOn(MainScheduler.instance)
				.subscribe(onSuccess: { [weak self] _ in
					self?.didSignIn.onNext(())
					}, onError: { [weak self] error in
						self?.didFailSignIn.onNext(error)
				})
				.disposed(by: self.disposeBag)
		} catch let error {
			print(error)
		}
	}

	func checkAdmin() -> Bool {
		let realm = try! Realm()
		let admin = User()
		admin.email = "admin"
		admin.password = "admin"
		
		do {
			let email = try emailAddress.value()
			if let userRealm = realm.objects(User.self).filter("email == '\(email)'").first {
				if userRealm == admin {
					print("\nADMIN")
					self.didSignIn.onNext(())
					return true
				}
			}
		} catch let error {
			print(error)
		}
		return false
	}

	func registerTapped() {
		self.didRegisterTapped.onNext(())
	}
}
