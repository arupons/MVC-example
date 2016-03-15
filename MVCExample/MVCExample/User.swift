//
//  User.swift
//  MVCExample
//
//  Created by Peter Druska on 14/03/16.
//  Copyright © 2016 Bedots.eu. All rights reserved.
//

import UIKit

class User: NSObject {
    var userName: String!
    var email: String!
    var password: String!
    
    init(userName: String, email: String, password: String) {
        self.userName = userName
        self.email = email
        self.password = password
    }
    
    override var description: String {
        return  "Username: \(userName) " +
                "Email \(email) " +
                "Password \(password)"
    }
}
