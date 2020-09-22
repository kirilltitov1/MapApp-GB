//
//  authAPI.swift
//  MapApp
//
//  Created by Кирилл Титов on 08.09.2020.
//  Copyright © 2020 Кирилл Титов. All rights reserved.
//

import Foundation
import Alamofire

final class AuthAPI {

	func auth(
		byEmail email: String,
		password: String,
		completion: @escaping (AuthResponse?) -> Void) {

		let url = ""
		let parameters: [String : String] = ["" : ""]

		AF.request(url, method: .post, parameters: parameters).responseDecodable(of: AuthResponse.self) { response in
			switch response.result {
			case let .success(success):
				completion(success)
			case let .failure(error):
				print("AuthAPI.auth() \(error)")
			}
		}
	}
}
