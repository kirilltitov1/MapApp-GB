//
//  InitialInitialConfigurator.swift
//  MapApp-GB
//
//  Created by kirill on 01/09/2020.
//  Copyright © 2020 nil. All rights reserved.
//

import UIKit

class InitialModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? InitialViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: InitialViewController) {

        let router = InitialRouter()

        let presenter = InitialPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = InitialInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
