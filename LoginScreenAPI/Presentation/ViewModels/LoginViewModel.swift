//
//  LoginViewModel.swift
//  LoginScreenAPI
//
//  Created by Cesar Rojas on 5/9/25.
//

import Foundation

class LoginViewModel {
    private let loginUseCase: LoginUseCase
    
    var onLoginSucces: (() -> Void)?
    var onLoginFailure: ((Error) -> Void)?
    
    init(loginUseCase: LoginUseCase) {
        self.loginUseCase = loginUseCase
    }
    
    func logic(email: String, password: String) {
        loginUseCase.execute(email: email, password: password) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success:
                    self?.onLoginSucces?()
                case .failure(let error):
                    self?.onLoginFailure?(error)
                }
            }
        }
    }
    
    func signUp() {
        
    }
}
