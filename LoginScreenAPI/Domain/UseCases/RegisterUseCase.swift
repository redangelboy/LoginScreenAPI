//
//  RegisterUseCase.swift
//  LoginScreenAPI
//
//  Created by Cesar Rojas on 5/9/25.
//

import Foundation

protocol RegisterUseCaseProtocol {
    func execute(email: String, password: String, completion: @escaping (Result<Void, Error>) -> Void)
}

class RegisterUseCaseImpl: RegisterUseCaseProtocol {
    
    
    private let repository: AuthRepository
    
    init(repository: AuthRepository) {
        self.repository = repository
    }
    
    func execute(email: String, password: String, completion: @escaping (Result<Void, Error>) -> Void) {
        repository.register(email: email, password: password, completion: completion)
    }
}
