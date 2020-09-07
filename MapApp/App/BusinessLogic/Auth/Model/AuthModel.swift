//
//  AuthModel.swift
//  MapApp
//
//  Created by Кирилл Титов on 06.09.2020.
//  Copyright © 2020 Кирилл Титов. All rights reserved.
//

import Foundation
import RxSwift

struct AuthResponse {
    let token: String
    let userId: String
}

protocol Auth {
    func signIn() -> Single<AuthResponse>
}

class AuthService: Auth {
    func signIn() -> Single<AuthResponse> {
        return Single<AuthResponse>.create { single in
            // call to backend
			print("AuthService 'singIn'")
            single(.success(AuthResponse(token: "12345", userId: "5678")))
            return Disposables.create()
        }
    }
}
