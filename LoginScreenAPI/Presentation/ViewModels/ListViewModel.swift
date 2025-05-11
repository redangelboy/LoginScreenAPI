//
//  ListViewModel.swift
//  LoginScreenAPI
//
//  Created by Cesar Rojas on 5/8/25.
//

import Foundation

class ListViewModel {
    private let fetchUsersUseCase: FetchUsersUseCase
    
    var users: [User] = []
    var onUsersFetched: (() -> Void)?
    var onError: ((Error) -> Void)?
    
    init(fetchUsersUseCase: FetchUsersUseCase) {
        self.fetchUsersUseCase = fetchUsersUseCase
    }
    
    func fetchUsers() {
        fetchUsersUseCase.execute { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let users):
                    self?.users = users
                    self?.onUsersFetched?()
                case .failure(let error):
                    self?.onError?(error)
                }
            }
        }
    }
}
