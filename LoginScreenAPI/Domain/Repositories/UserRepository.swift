//
//  UserRepository.swift
//  LoginScreenAPI
//
//  Created by Cesar Rojas on 5/8/25.
//

import Foundation

protocol UserRepository {
    func getUsers(completion: @escaping (Result<[User], Error>) -> Void)
}
