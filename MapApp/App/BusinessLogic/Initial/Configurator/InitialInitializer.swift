//
//  InitialInitialInitializer.swift
//  MapApp-GB
//
//  Created by kirill on 01/09/2020.
//  Copyright © 2020 nil. All rights reserved.
//

import UIKit

class InitialModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var initialViewController: InitialViewController!

    override func awakeFromNib() {

        let configurator = InitialModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: initialViewController)
    }

}
