//
//  LoginUseCase.swift
//  LoginScreenAPI
//
//  Created by Cesar Rojas on 5/9/25.
//

import Foundation

protocol LoginUseCase {
    func execute(email: String, password: String, completion: @escaping (Result<Void, Error>) -> Void)
}
