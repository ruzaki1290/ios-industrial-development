//
//  SettingsViewController.swift
//  Navigation
//

import UIKit

public final class SettingsViewController: UIViewController {
    
    private let sortingSwitch = UISwitch()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        title = "Settings"

        sortingSwitch.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(sortingSwitch)

        NSLayoutConstraint.activate([
            sortingSwitch.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            sortingSwitch.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        sortingSwitch.isOn = Settings.shared.isSortingEnabled
        
        sortingSwitch.addTarget(
            self,
            action: #selector(sortingSwitchChanged),
            for: .valueChanged
        )
        
    } // viewDidLoad()
    
    @objc private func sortingSwitchChanged() {

        Settings.shared.isSortingEnabled = sortingSwitch.isOn
        
        NotificationCenter.default.post(
            name: Notification.Name("SortingChanged"),
            object: nil
        )

    }
    
} // SettingsViewController

