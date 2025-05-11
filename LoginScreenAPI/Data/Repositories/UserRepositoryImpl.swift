//
//  UserRepositoryImpl.swift
//  LoginScreenAPI
//
//  Created by Cesar Rojas on 5/8/25.
//

import Foundation

class UserRepositoryImpl: UserRepository {
    private let remoteDataSource: UserRemoteDataSourceProtocol
    
    init(remoteDataSource: UserRemoteDataSourceProtocol) {
        self.remoteDataSource = remoteDataSource
    }
    
    func getUsers(completion: @escaping (Result<[User], Error>) -> Void) {
        remoteDataSource.fetchUsers(completition: completion)
    }
    
}
