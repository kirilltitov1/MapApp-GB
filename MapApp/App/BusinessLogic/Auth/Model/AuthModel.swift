//
//  AuthModel.swift
//  MapApp
//
//  Created by Кирилл Титов on 06.09.2020.
//  Copyright © 2020 Кирилл Титов. All rights reserved.
//

import Foundation
import RxSwift

struct SignInResponse {
    let token: String
    let userId: String
}

protocol Auth {
    func signIn() -> Single<SignInResponse>
}

class SessionService: Auth {
    func signIn() -> Single<SignInResponse> {
        return Single<SignInResponse>.create { single in
            // call to backend
            single(.success(SignInResponse(token: "12345", userId: "5678")))
            return Disposables.create()
        }
    }
}
