//
//  RegisterModel.swift
//  MapApp
//
//  Created by Кирилл Титов on 08.09.2020.
//  Copyright © 2020 Кирилл Титов. All rights reserved.
//

import RxSwift
import Alamofire

struct RegisterResponse: Codable {
	let accessToken: String
	let refreshToken: String
}

protocol Reg {
	func register(email: String, password: String) -> Single<RegisterResponse>
}

class RegisterModel: Reg {
	func register(email: String, password: String) -> Single<RegisterResponse> {
		let url = Constants.Paths.userRegisterStringURL
		let parameters: [String : String] = ["email" : email,
											 "password" : password]
		return Single<RegisterResponse>.create { single in
			AF.request(url, method: .post, parameters: parameters).responseDecodable(of: RegisterResponse.self) { response in
				switch response.result {
				case let .success(success):
					single(.success(success))
				case let .failure(error):
					single(.error(error))
				}
			}
			return Disposables.create()
		}
	}
}
