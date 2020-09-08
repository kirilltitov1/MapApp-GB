//
//  AuthController.swift
//  MapApp
//
//  Created by Кирилл Титов on 06.09.2020.
//  Copyright © 2020 Кирилл Титов. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class AuthViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
	@IBOutlet weak var registrationButton: UIButton!

    private let disposeBag = DisposeBag()

	var viewModel: AuthViewModel!

    override func viewDidLoad() {

        self.setUpBindings()
        super.viewDidLoad()
    }

    private func setUpBindings() {
		// auth bindings
        self.emailTextField.rx.text.orEmpty
            .bind(to: self.viewModel.emailAddress)
            .disposed(by: self.disposeBag)

        self.passwordTextField.rx.text.orEmpty
            .bind(to: self.viewModel.password)
            .disposed(by: self.disposeBag)

        self.loginButton.rx.tap
            .bind { [weak self] in self?.viewModel.signInTapped() }
            .disposed(by: self.disposeBag)

        self.viewModel.isSignInActive
            .bind(to: self.loginButton.rx.isEnabled)
            .disposed(by: self.disposeBag)

        self.viewModel.didSignIn
            .subscribe(onNext: {
                // navigate to dashboard
                print("Signed In")
            })
            .disposed(by: self.disposeBag)

        self.viewModel.didFailSignIn
            .subscribe(onNext: { error in
                print("Failed: \(error)")
                // show error
            })
            .disposed(by: self.disposeBag)

		// register bindings
		self.registrationButton.rx.tap.bind { [weak self] in self?.viewModel.registerTapped() }
			.disposed(by: self.disposeBag)
    }
}
