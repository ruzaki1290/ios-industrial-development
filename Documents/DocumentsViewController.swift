//
//  DocumentsViewController.swift
//  Navigation
//

import UIKit

final class DocumentsViewController: UIViewController {
    
    private let tableView = UITableView()
    private var files: [URL] = []
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        title = "Documents"
        
        setupNavigationBar()
        setupTableView()
        loadFiles()
        
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
        tableView.dataSource = self
        
        view.addSubview(tableView)
        
    }
    
    private func loadFiles() {
        
            let fileManager = FileManager.default
            
            guard let documentsURL = fileManager.urls(
                for: .documentDirectory,
                in: .userDomainMask
            ).first else {
                return
            }
            
            do {
                files = try fileManager.contentsOfDirectory(
                    at: documentsURL,
                    includingPropertiesForKeys: nil
                )
            
            print("📁 DOCUMENTS FILES:", files)
            
        } catch{
            print("Ошибка чтения Documents: \(error)")
        }
    
    } // loadFiles()
    
    @objc private func addPhoto() {
        
        let imagePicker = UIImagePickerController()
            imagePicker.sourceType = .photoLibrary
            imagePicker.delegate = self
            present(imagePicker, animated: true)
        
        }
    
    
} // DocumentsViewController: UIViewController


extension DocumentsViewController: UIImagePickerControllerDelegate,
                                   UINavigationControllerDelegate {
    
    func imagePickerController(
        _ picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]
    ) {
        
        picker.dismiss(animated: true)
        guard let image = info[.originalImage] as? UIImage else {
            return
        }
        
        guard let data = image.jpegData(compressionQuality: 1.0) else {
            return
        }
        
        let fileName = UUID().uuidString + ".jpg"
        let fileManager = FileManager.default
        
        guard let documentsURL = fileManager.urls(
            for: .documentDirectory,
            in: .userDomainMask
            
        ).first else {
            return
            
        }
        let fileURL = documentsURL.appendingPathComponent(fileName)
        
        do {
            
            try data.write(to: fileURL)
            print("Фото сохранено:", fileURL)
            loadFiles()
            tableView.reloadData()
            
        } catch {
            
            print("Ошибка сохранения:", error)
        }
        
    } // imagePickerController
    

} // extention DocumentsViewController

extension DocumentsViewController: UITableViewDataSource {
    
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return files.count
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        
        let cell = UITableViewCell(
            style: .default,
            reuseIdentifier: nil
        )
        
        let fileURL = files[indexPath.row]
        
        cell.textLabel?.text = fileURL.lastPathComponent
        cell.imageView?.image = UIImage(contentsOfFile: fileURL.path)
        
        return cell
        
    }
    
}
