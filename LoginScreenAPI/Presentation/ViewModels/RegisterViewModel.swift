//
//  File.swift
//  LoginScreenAPI
//
//  Created by Cesar Rojas on 5/9/25.
//

import Foundation

class RegisterViewModel {
    private let registerUseCase: RegisterUseCaseImpl

    var onRegisterSuccess: (() -> Void)?
    var onRegisterFailure: ((Error) -> Void)?

    init(registerUseCase: RegisterUseCaseImpl) {
        self.registerUseCase = registerUseCase
    }

    func register(email: String, password: String) {
        registerUseCase.execute(email: email, password: password) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success:
                    self?.onRegisterSuccess?()
                case .failure(let error):
                    self?.onRegisterFailure?(error)
                }
            }
        }
    }
}
