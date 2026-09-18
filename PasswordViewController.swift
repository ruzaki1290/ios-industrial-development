//
//  PasswordViewController.swift
//  Navigation
//

import UIKit

final class PasswordViewController: UIViewController {
    
    private let passwordTextField = UITextField()
    private let submitButton = UIButton(type: .system)
    private var firstPassword: String?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        setUpPasswordTextField()
        setupSubmitButton()
        setupConstraints()
        
    }
    
    private func setUpPasswordTextField() {
        
        passwordTextField.placeholder = "Введите пароль"
        passwordTextField.isSecureTextEntry = true
        passwordTextField.textContentType = .password
        
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.clearButtonMode = .whileEditing
        passwordTextField.returnKeyType = .done
        
        view.addSubview(passwordTextField)
        
    }
    
    private func setupSubmitButton() {
        
        submitButton.setTitle("Создать пароль", for: .normal)
        submitButton.titleLabel?.font = .systemFont(ofSize: 17, weight: .semibold)
        
        var configuaration = UIButton.Configuration.filled()
        configuaration.cornerStyle = .medium
        configuaration.baseForegroundColor = .white
        submitButton.configuration = configuaration
        
        submitButton.addTarget(
            self,
            action: #selector(handleSubmitTapped),
            for: .touchUpInside
        )
        
        view.addSubview(submitButton)
        
    }
    
    private func setupConstraints() {
        
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        NSLayoutConstraint.activate([
            passwordTextField.centerYAnchor.constraint(
                equalTo: view.centerYAnchor,
                constant: -40
            ),
            passwordTextField.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: 32
            ),
            passwordTextField.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -32
            ),
            passwordTextField.heightAnchor.constraint(equalToConstant: 48),
            
            submitButton.topAnchor.constraint(
                equalTo: passwordTextField.bottomAnchor,
                constant: 20
            ),
            submitButton.leadingAnchor.constraint(
                equalTo: passwordTextField.leadingAnchor
            ),
            submitButton.trailingAnchor.constraint(
                equalTo: passwordTextField.trailingAnchor
            ),
            submitButton.heightAnchor.constraint(equalToConstant: 50),
        ])
        
    }
    
    @objc private func handleSubmitTapped() {
        passwordTextField.resignFirstResponder()
        
        guard let passwordText = passwordTextField.text,
              !passwordText.isEmpty else {
            print("Пожалуйста, введите пароль! ❌")
            return
        }
        guard passwordText.count >= 4 else {
            print("Пароль должен содержать минимум 4 символа! ❌")
            return
        }
        
        if let firstPassword = firstPassword {
            
            if passwordText == firstPassword {
                print("Пароли совпадают! ✅")
            } else {
                print("Пароли не совпадают! ❌")
                
                self.firstPassword = nil
                passwordTextField.text = ""
                submitButton.setTitle("Создать пароль", for: .normal)
            }
            
        } else {
            firstPassword = passwordText
            
            passwordTextField.text = ""
            submitButton.setTitle("Повторите пароль", for: .normal)
            
            print("Первый пароль сохранён. Введите его повторно.")
        }
        
    } // handleSubmitTapped()
    
    
} // PasswordViewController
