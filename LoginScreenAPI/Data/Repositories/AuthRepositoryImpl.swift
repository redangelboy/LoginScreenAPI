//
//  AuthRepositoryImpl.swift
//  LoginScreenAPI
//
//  Created by Cesar Rojas on 5/9/25.
//

import Foundation

class AuthRepositoryImpl: AuthRepository {
    private let remoteDataSource: AuthRemoteDataSourceProtocol
    
    init(remoteDataSource: AuthRemoteDataSourceProtocol) {
        self.remoteDataSource = remoteDataSource
    }
    
    func login(email: String, password: String, completion: @escaping (Result<Void, any Error>) -> Void) {
        remoteDataSource.signIn(email: email, password: password, completion: completion)
    }
}

extension AuthRepositoryImpl {
    func register(email: String, password: String, completion: @escaping (Result<Void, Error>) -> Void) {
        remoteDataSource.signUp(email: email, password: password, completion: completion)
    }
}
