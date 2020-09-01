//
//  showAlert.swift
//  MapApp
//
//  Created by Кирилл Титов on 01.09.2020.
//  Copyright © 2020 Кирилл Титов. All rights reserved.
//

import Foundation
import UIKit

protocol showAlert {}

extension showAlert {
	func showAlert(message: String?) {
		let alertC = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
		alertC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))

		UIApplication.shared.windows.filter { $0.isKeyWindow }
			.first?
			.rootViewController?
			.present(alertC, animated: true, completion: nil)
	}
}
