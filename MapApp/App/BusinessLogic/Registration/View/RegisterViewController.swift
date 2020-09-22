//
//  RegisterViewController.swift
//  MapApp
//
//  Created by Кирилл Титов on 08.09.2020.
//  Copyright © 2020 Кирилл Титов. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class RegisterViewController: UIViewController {

	@IBOutlet weak var emailField: UITextField!
	@IBOutlet weak var password: UITextField!
	@IBOutlet weak var repeatPassword: UITextField!
	@IBOutlet weak var registerButton: UIButton!

	private let disposeBag = DisposeBag()

	var viewModel: RegisterViewModel!

    override func viewDidLoad() {
		self.setUpBindings()

		super.viewDidLoad()
    }

    private func setUpBindings() {
		self.emailField.rx.text.orEmpty
			.bind(to: self.viewModel.emailAddress)
			.disposed(by: self.disposeBag)

		self.password.rx.text.orEmpty
			.bind(to: self.viewModel.password)
			.disposed(by: self.disposeBag)

		self.repeatPassword.rx.text.orEmpty
			.bind(to: self.viewModel.repeatPassword)
			.disposed(by: self.disposeBag)

		self.registerButton.rx.tap
			.bind { [weak self] in self?.viewModel.registerTapped() }
			.disposed(by: self.disposeBag)

		self.viewModel.isRegisterActive
			.bind(to: self.registerButton.rx.isEnabled)
			.disposed(by: self.disposeBag)

		self.viewModel.didRegister
			.subscribe(onNext: {
				print("Registred")
			})
			.disposed(by: self.disposeBag)

		self.viewModel.didFailRegister
		.subscribe(onNext: { error in
			print("Failed: \(error)")

			let alertC = UIAlertController(title: "Registration fail", message: "User alredy exist", preferredStyle: .alert)
			alertC.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
			self.present(alertC, animated: false, completion: nil)
		})
		.disposed(by: self.disposeBag)
	}

}
