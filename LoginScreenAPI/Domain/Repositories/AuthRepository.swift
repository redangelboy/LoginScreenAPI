//
//  AuthRepository.swift
//  LoginScreenAPI
//
//  Created by Cesar Rojas on 5/9/25.
//

import Foundation

protocol AuthRepository {
    func login(email: String, password: String, completion: @escaping (Result<Void, Error>) -> Void)
    func register(email: String, password: String, completion: @escaping (Result<Void, Error>) -> Void)
}
