//
//  ViewController.swift
//  LoginScreenAPI
//
//  Created by Cesar Rojas on 4/21/25.
//

import UIKit

class LoginViewController: UIViewController, GradientSupportable {
    
    var gradientLayer: CAGradientLayer?
    private let viewModel: LoginViewModel
    
    init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let loginLabel: UILabel = {
        let label = UILabel()
        label.text = "Sing In"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    private let userLabel: UILabel = {
        let label = UILabel()
        label.text = "Email"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 10)
        return label
    }()
    
    private let userTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter your Email"
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .systemBlue
        textField.autocapitalizationType = .none
        return textField
    }()
    
    private let passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "Password"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 10)
        return label
    }()
    
    private let passwordTextField: UITextField = {
        let passField = UITextField()
        passField.placeholder = "password"
        passField.isSecureTextEntry = true
        passField.backgroundColor = .systemBlue
        passField.borderStyle = .roundedRect
        return passField
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("LOGIN", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.backgroundColor = .white
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.layer.cornerRadius = 20
        return button
    }()
    
    private let signUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("SIGN UP", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.backgroundColor = .white
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.layer.cornerRadius = 20
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        applyBlueGradientBackground()
        setupLayout()
        bindViewModel()
        loginButton.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        signUpButton.addTarget(self, action: #selector(handleSignUp), for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        gradientLayer?.frame = view.bounds
    }
    
    private func bindViewModel() {
        viewModel.onLoginSucces = { [weak self] in
            let listVC = AppDIContainer.makeListViewController()
            self?.navigationController?.pushViewController(listVC, animated: true)
        }
        
        viewModel.onLoginFailure = { [weak self] error in
            let alert = UIAlertController(title: "Login Failed", message: error.localizedDescription, preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Sign Up", style: .default, handler: { _ in
                let signUpVC = AppDIContainer.makeRegisterViewController()
                self?.navigationController?.pushViewController(signUpVC, animated: true)
            }))
                            
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
            DispatchQueue.main.async {
                self?.present(alert, animated: true)
            }
        }
    }
    
    private func setupLayout() {
        view.addSubview(loginLabel)
        view.addSubview(userLabel)
        view.addSubview(userTextField)
        view.addSubview(passwordLabel)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)
        view.addSubview(signUpButton)
        
        loginLabel.translatesAutoresizingMaskIntoConstraints = false
        userLabel.translatesAutoresizingMaskIntoConstraints = false
        userTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            loginLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            
            userLabel.leadingAnchor.constraint(equalTo: userTextField.leadingAnchor, constant: 5),
            userLabel.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 30),

            userTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            userTextField.topAnchor.constraint(equalTo: userLabel.bottomAnchor, constant: 5),
            userTextField.widthAnchor.constraint(equalToConstant: 300),
            userTextField.heightAnchor.constraint(equalToConstant: 40),
            
            passwordLabel.leadingAnchor.constraint(equalTo: passwordTextField.leadingAnchor, constant: 5),
            passwordLabel.topAnchor.constraint(equalTo: userTextField.bottomAnchor, constant: 20),
            
            passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 5),
            passwordTextField.widthAnchor.constraint(equalToConstant: 300),
            passwordTextField.heightAnchor.constraint(equalToConstant: 40),
            
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 40),
            loginButton.widthAnchor.constraint(equalToConstant: 300),
            loginButton.heightAnchor.constraint(equalToConstant: 40),
            
            signUpButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signUpButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 20),
            signUpButton.widthAnchor.constraint(equalToConstant: 300),
            signUpButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    @objc private func handleLogin() {
        guard let email = userTextField.text,  let password = passwordTextField.text else { return }
        viewModel.logic(email: email, password: password)
    }
    
    @objc private func handleSignUp() {
        let signUpVC = AppDIContainer.makeRegisterViewController()
        self.navigationController?.pushViewController(signUpVC, animated: true)
    }

}

