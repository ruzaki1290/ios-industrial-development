//
//  DocumentsViewController.swift
//  Navigation
//

import UIKit

final class DocumentsViewController: UIViewController {
    
    private let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        title = "Documents"
        
        setupNavigationBar()
        setupTableView()
        
    }
    
    private func setupNavigationBar() {
        
            navigationItem.rightBarButtonItem = UIBarButtonItem(
                title: "Добавить фото",
                style: .plain,
                target: self,
                action: #selector(addPhoto)
            )

        }
    
    private func setupTableView() {

            tableView.frame = view.bounds
            tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            view.addSubview(tableView)

        }
    
    @objc private func addPhoto() {
            // Здесь следующим шагом откроем Image Picker
        }
    
} // DocumentsViewController: UIViewController
