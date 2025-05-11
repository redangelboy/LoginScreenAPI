//
//  UserRemoteDataSource.swift
//  LoginScreenAPI
//
//  Created by Cesar Rojas on 5/8/25.
//

import Foundation

protocol UserRemoteDataSourceProtocol {
    func fetchUsers(completition: @escaping (Result<[User], Error>) -> Void)
}

class UserRemoteDataSource: UserRemoteDataSourceProtocol {
    func fetchUsers(completition: @escaping (Result<[User], Error>) -> Void) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
            completition(.failure(NSError(domain: "Inavlid URL", code: -1)))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completition(.failure(error))
                return
            }
            
            guard let data = data else {
                completition(.failure(NSError(domain: "No data", code: -1)))
                return
            }
            
            do {
                let users = try JSONDecoder().decode([User].self, from: data)
                completition(.success(users))
            } catch {
                completition(.failure(error))
            }
        }
        task.resume()
    }
}
