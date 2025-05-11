//
//  User.swift
//  LoginScreenAPI
//
//  Created by Cesar Rojas on 5/8/25.
//

import Foundation

struct User: Decodable {
    let id: Int
    let title: String
    let body: String
}
