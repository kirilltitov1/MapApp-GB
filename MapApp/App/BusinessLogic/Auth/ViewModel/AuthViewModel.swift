//
//  AuthViewModel.swift
//  MapApp
//
//  Created by Кирилл Титов on 06.09.2020.
//  Copyright © 2020 Кирилл Титов. All rights reserved.
//

import Foundation
import RxSwift

class SignInViewModel {

    private let disposeBag = DisposeBag()
    private let authentication: Authentication

    let emailAddress = BehaviorSubject(value: "")
    let password = BehaviorSubject(value: "")
    let isSignInActive: Observable<Bool>

    // events
    let didSignIn = PublishSubject<Void>()
    let didFailSignIn = PublishSubject<Error>()

    init(authentication: Authentication) {
        self.authentication = authentication
        self.isSignInActive = Observable.combineLatest(self.emailAddress, self.password).map { $0.0 != "" && $0.1 != "" }
    }

    func signInTapped() {
        self.authentication.signIn()
            .map { _ in }
            .observeOn(MainScheduler.instance)
            .subscribe(onSuccess: { [weak self] _ in
                self?.didSignIn.onNext(())
            }, onError: { [weak self] error in
                self?.didFailSignIn.onNext(error)
            })
            .disposed(by: self.disposeBag)
    }
}
