//
//  FetchUsersUseCase.swift
//  LoginScreenAPI
//
//  Created by Cesar Rojas on 5/8/25.
//

import Foundation

class FetchUsersUseCase {
    private let repository: UserRepository
    
    init(repository: UserRepository) {
        self.repository = repository
    }
    
    func execute(completion: @escaping (Result<[User], Error>) -> Void) {
        repository.getUsers(completion: completion)
    }
}
