//
//  InitialInitialConfiguratorTests.swift
//  MapApp-GB
//
//  Created by kirill on 01/09/2020.
//  Copyright © 2020 nil. All rights reserved.
//

import XCTest

class InitialModuleConfiguratorTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testConfigureModuleForViewController() {

        //given
        let viewController = InitialViewControllerMock()
        let configurator = InitialModuleConfigurator()

        //when
        configurator.configureModuleForViewInput(viewInput: viewController)

        //then
        XCTAssertNotNil(viewController.output, "InitialViewController is nil after configuration")
        XCTAssertTrue(viewController.output is InitialPresenter, "output is not InitialPresenter")

        let presenter: InitialPresenter = viewController.output as! InitialPresenter
        XCTAssertNotNil(presenter.view, "view in InitialPresenter is nil after configuration")
        XCTAssertNotNil(presenter.router, "router in InitialPresenter is nil after configuration")
        XCTAssertTrue(presenter.router is InitialRouter, "router is not InitialRouter")

        let interactor: InitialInteractor = presenter.interactor as! InitialInteractor
        XCTAssertNotNil(interactor.output, "output in InitialInteractor is nil after configuration")
    }

    class InitialViewControllerMock: InitialViewController {

        var setupInitialStateDidCall = false

        override func setupInitialState() {
            setupInitialStateDidCall = true
        }
    }
}
