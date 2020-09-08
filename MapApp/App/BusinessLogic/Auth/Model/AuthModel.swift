//
//  AuthModel.swift
//  MapApp
//
//  Created by Кирилл Титов on 06.09.2020.
//  Copyright © 2020 Кирилл Титов. All rights reserved.
//

import RxSwift
import Alamofire

struct AuthResponse: Codable {

	let accessToken: String
	let refreshToken: String
	let expires: Int
}

protocol Auth {
	func autn(email: String, password: String) -> Single<AuthResponse>
}

class AuthService: Auth {
	func autn(email: String, password: String) -> Single<AuthResponse> {
		let url = Constants.Paths.userLoginStringURL
		let parameters: [String : String] = ["email" : email,
											 "password": password]

        return Single<AuthResponse>.create { single in

			AF.request(url, method: .post, parameters: parameters).responseDecodable(of: AuthResponse.self) { response in
				switch response.result {
				case let .success(success):
					single(.success(success))
				case let .failure(error):
					print("AuthAPI.auth() \(error)")
					single(.error(error))
				}
			}
            return Disposables.create()
        }
    }
}
