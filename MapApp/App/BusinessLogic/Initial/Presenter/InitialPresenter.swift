//
//  InitialInitialPresenter.swift
//  MapApp-GB
//
//  Created by kirill on 01/09/2020.
//  Copyright © 2020 nil. All rights reserved.
//

class InitialPresenter: InitialModuleInput, InitialViewOutput, InitialInteractorOutput {

    weak var view: InitialViewInput!
    var interactor: InitialInteractorInput!
    var router: InitialRouterInput!

    func viewIsReady() {

    }
}
