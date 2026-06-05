//
//  InfoViewController.swift
//  Navigation
//

import UIKit

final class InfoViewController: UIViewController {

    private let todoTitleLabel: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = "Loading..."
        return label
        
    }()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        view.backgroundColor = .systemGray6
        
        createAlertButton()
        
        view.addSubview(todoTitleLabel)
        
        NSLayoutConstraint.activate([
            todoTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            todoTitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            todoTitleLabel.bottomAnchor.constraint(equalTo: view.centerYAnchor, constant: -50)
        ])
        
        fetchTodo()
        
    }
    
    private func fetchTodo() {
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/todos/1") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in

            if let error = error {
                print(error.localizedDescription)
                return
            }

            guard let data = data else {
                return
            }
            
            do {
                let jsonObject = try JSONSerialization.jsonObject(with: data)

                guard let dictionary = jsonObject as? [String: Any],
                      let title = dictionary["title"] as? String else {
                    return
                }
                
                DispatchQueue.main.async {
                    self?.todoTitleLabel.text = title
                }
                
            } catch {
                print(error.localizedDescription)
            }
        }

        task.resume()
    }
    
    
    private func createAlertButton() {
        
        let button = CustomButton(title: "Alert") { [weak self] in
            self?.tapAlertButton()
        }
                
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            button.heightAnchor.constraint(equalToConstant: 50),
            button.widthAnchor.constraint(equalToConstant: 100)
        ])
        
    }
    
   
    
    @objc func tapAlertButton() {
        let alert = UIAlertController(title: "Attention",
                                      message: "How are you feeling?",
                                      preferredStyle: .alert)
        // add two buttons
        let fine = UIAlertAction(title: "Fine", style: .default) { _ in
            print("Fine")
        }
        alert.addAction(fine)
        
        let so = UIAlertAction(title: "So-so", style: .destructive) { _ in
            print("So-so")
        }
        alert.addAction(so)

        self.present(alert, animated: true, completion: nil)
    }
    
} // InfoViewController
