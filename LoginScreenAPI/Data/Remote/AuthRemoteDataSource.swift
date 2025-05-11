//
//  AuthRemoteDataSource.swift
//  LoginScreenAPI
//
//  Created by Cesar Rojas on 5/9/25.
//

import FirebaseAuth

protocol AuthRemoteDataSourceProtocol {
    func signIn(email: String, password: String, completion: @escaping (Result<Void, Error>) -> Void)
    func signUp(email: String, password: String, completion: @escaping (Result<Void, Error>) -> Void)
}

class AuthRemoteDataSource: AuthRemoteDataSourceProtocol {
    func signIn(email: String, password: String, completion: @escaping (Result<Void, any Error>) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { _, error in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(()))
            }
        }
    }
}

extension AuthRemoteDataSource {
    func signUp(email: String, password: String, completion: @escaping (Result<Void, any Error>) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { _, error in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(()))
            }
        }
    }
}
