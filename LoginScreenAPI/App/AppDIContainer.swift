//
//  AppDIContainer.swift
//  LoginScreenAPI
//
//  Created by Cesar Rojas on 5/8/25.
//

import Foundation

class AppDIContainer {
    static func makeLoginViewController() -> LoginViewController {
        let remoteDataSource = AuthRemoteDataSource()
        let repository = AuthRepositoryImpl(remoteDataSource: remoteDataSource)
        let useCase = LoginUseCaseImpl(repository: repository)
        let viewModel = LoginViewModel(loginUseCase: useCase)
        return LoginViewController(viewModel: viewModel)
    }
}

extension AppDIContainer {
    static func makeRegisterViewController() -> signUpViewController {
        let remoteDataSource = AuthRemoteDataSource()
        let repository = AuthRepositoryImpl(remoteDataSource: remoteDataSource)
        let useCase = RegisterUseCaseImpl(repository: repository)
        let viewModel = RegisterViewModel(registerUseCase: useCase)
        return signUpViewController(viewModel: viewModel)
    }
}

extension AppDIContainer {
    static func makeListViewController() -> ListViewController {
        let remoteDataSource = UserRemoteDataSource()
        let repository = UserRepositoryImpl(remoteDataSource: remoteDataSource)
        let useCase = FetchUsersUseCase(repository: repository)
        let viewModel = ListViewModel(fetchUsersUseCase: useCase)
        let vc = ListViewController(viewModel: viewModel)
        
        return vc
    }
}
