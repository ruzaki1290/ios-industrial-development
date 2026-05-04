//
//  FeedViewController.swift
//  Navigation
//

import UIKit
import StorageService

final class FeedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemTeal
        setupGuessViews()
        
        createSubView()
    }
    
    private func createSubView() {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        view.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 200),
            stackView.widthAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.widthAnchor, constant: -32)
        ])
        addPostButton(title: "Post number 1", color: .systemPurple, to: stackView, selector: #selector(tapPostButton))
        addPostButton(title: "Post number 2", color: .systemIndigo, to: stackView, selector: #selector(tapPostButton))
    }
    
    private func addPostButton(title: String, color: UIColor, to view: UIStackView, selector: Selector) {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(title, for: .normal)
        button.backgroundColor = color
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = LayoutConstants.cornerRadius
        button.addTarget(self, action: selector, for: .touchUpInside)
        view.addArrangedSubview(button)
    }
    
    private let feedModel = FeedModel()
    
    private let guessTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Введите слово"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let resultLabel: UILabel = {
        let label = UILabel()
        label.text = "Введите слово и проверьте"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var checkGuessButton = CustomButton(title: "Проверить") {
        [weak self] in self?.checkGuess()
    }
    
    private func checkGuess() {
        guard let word = guessTextField.text, !word.isEmpty else {
            resultLabel.text = "Введите слово"
            resultLabel.textColor = .systemRed
            return
        }
        
        let isCorrect = feedModel.check(word: word)
        
        if isCorrect {
            resultLabel.text = "Верно! 😃"
            resultLabel.textColor = .systemYellow
        } else {
            resultLabel.text = "Неверно ☹️"
            resultLabel.textColor = .systemRed
        }
    }
    
    private func setupGuessViews() {
        view.addSubview(guessTextField)
        view.addSubview(checkGuessButton)
        view.addSubview(resultLabel)
        
        NSLayoutConstraint.activate([
            
            guessTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            guessTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            guessTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            guessTextField.heightAnchor.constraint(equalToConstant: 44),
            
            checkGuessButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            checkGuessButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            checkGuessButton.topAnchor.constraint(equalTo: guessTextField.bottomAnchor, constant: 16),
            checkGuessButton.heightAnchor.constraint(equalToConstant: 50),
            
            resultLabel.topAnchor.constraint(equalTo: checkGuessButton.bottomAnchor, constant: 16),
            resultLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            resultLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24)
        ])
    }
    
    @objc func tapPostButton() {
        let post = postExamples[0]
        
        let postVC = PostViewController()
        postVC.post = post
        navigationController?.pushViewController(postVC, animated: true)
    }
    
} //FeedViewController


