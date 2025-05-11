//
//  LoginUseCaseImpl.swift
//  LoginScreenAPI
//
//  Created by Cesar Rojas on 5/9/25.
//

import Foundation

enum loginError: Error {
    case invalidCredentials
}

//class LoginUseCaseImpl: LoginUseCase {
//    func execute(email: String, password: String, completition: @escaping (Result<Bool, Error>) -> Void) {
//        // Dummy logic
//        if email == "123" && password == "123" {
//            completition(.success(true))
//        } else {
//            completition(.failure(loginError.invalidCredentials))
//        }
//    }
//}


class LoginUseCaseImpl: LoginUseCase {
    private let repository: AuthRepository
    
    init(repository: AuthRepository) {
        self.repository = repository
    }
    
    func execute(email: String, password: String, completion: @escaping (Result<Void, Error>) -> Void) {
        repository.login(email: email, password: password, completion: completion)
    }
}
