//
//  SettingsViewController.swift
//  Navigation
//

import UIKit

final class SettingsViewController: UIViewController {
    
    private let sortingSwitch = UISwitch()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        sortingSwitch.isOn = Settings.shared.isSortingEnabled
        
        sortingSwitch.addTarget(
            self,
            action: #selector(sortingSwitchChanged),
            for: .valueChanged
        )
        
    } // viewDidLoad()
    
    @objc private func sortingSwitchChanged() {

        Settings.shared.isSortingEnabled = sortingSwitch.isOn

    }
    
} // SettingsViewController

