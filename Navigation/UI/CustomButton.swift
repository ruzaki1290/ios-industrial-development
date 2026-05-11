//
//  CustomButton.swift
//  Navigation
//
import UIKit

final class CustomButton: UIButton {
    
    private var action: (() -> Void)?
    
    init(
        title: String,
        action: @escaping () -> Void
    ){
        self.action = action
        super.init(frame: .zero)
        
        translatesAutoresizingMaskIntoConstraints = false
        
        setTitle(title, for: .normal)
        setTitleColor(.white, for: .normal)
        backgroundColor = .systemBlue
        layer.cornerRadius = 12
        
        addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func buttonTapped() {
        action?()
    }
    
    
} // CustomButton
