//
//  User.swift
//  MapApp
//
//  Created by Kirill Titov on 12.09.2020.
//  Copyright © 2020 Кирилл Титов. All rights reserved.
//

import Foundation
import RealmSwift

class User: Object {
	@objc dynamic var email = ""
	@objc dynamic var password = ""
	
//	init(email: String, password: String) {
//		super.init()
//
//		self.email = email
//		self.password = password
//	}
//
////	required init() {
////		fatalError("init() has not been implemented")
////	}
	
	override class func primaryKey() -> String? {
		return "email"
	}
	
	static func ==(lhs: User, rhs: User) -> Bool {
		if lhs.email == rhs.email && lhs.password == rhs.password {
			return true
		}
		return false
	}
}
