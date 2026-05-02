//
//  ProfileHeaderView.swift
//  Navigation
//

import UIKit
import SnapKit
import StorageService

final class ProfileHeaderView: UITableViewHeaderFooterView {
    
    // MARK: Visual objects
    
    var fullNameLabel = UILabel()
    var avatarImageView = UIImageView()
    var statusLabel = UILabel()
    var statusTextField = UITextField()
    lazy var setStatusButton = CustomButton(title: "Show status") { [weak self] in
        self?.didTapSetStatus()
    }
    lazy var returnAvatarButton = CustomButton(title: "") { [weak self] in
        self?.didTapOnAvatar()
    }
    var avatarBackground = UIView()
    
    private var statusText = "Ready to help"
    private var avatarOriginPoint = CGPoint()
    
    // MARK: - Setup section
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        setupNameLabel()
        setupStatusLabel()
        setupStatusTextField()
        setupStatusButton()
        setupAvatarImage()
        
        statusTextField.delegate = self
    }

    required init?(coder: NSCoder) {
        fatalError("lol")
    }
    
    private func didTapSetStatus() {
        print("Status button tapped")
        
        statusLabel.text = statusTextField.text
    }
    
    private func setupNameLabel() {
        
        fullNameLabel.text = ""
        fullNameLabel.font = .boldSystemFont(ofSize: 18)
        fullNameLabel.textColor = .black
        addSubview(fullNameLabel)
        
        fullNameLabel.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(16)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading).offset(156)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing).offset(-16)
            make.height.equalTo(28)
        }
        
    }
    
    private func setupStatusLabel() {
        
        statusLabel.text = statusText
        statusLabel.font = .systemFont(ofSize: 17)
        statusLabel.textColor = .black
        addSubview(statusLabel)
        
        statusLabel.snp.makeConstraints { make in
            make.top.equalTo(fullNameLabel.snp.bottom).offset(16)
            make.leading.equalTo(fullNameLabel.snp.leading)
            make.trailing.equalTo(fullNameLabel.snp.trailing)
            make.height.equalTo(fullNameLabel.snp.height)
        }
        
    }
    
    private func setupStatusTextField() {
        
        statusTextField.textColor = .darkGray
        statusTextField.backgroundColor = .white
        
        let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 20))
        statusTextField.leftView = paddingView
        statusTextField.leftViewMode = .always
        statusTextField.layer.cornerRadius = 8
        statusTextField.layer.borderWidth = 1
        statusTextField.layer.borderColor = UIColor.gray.cgColor
        statusTextField.attributedPlaceholder = NSAttributedString.init(
            string: "", attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray]
        )
        
        statusTextField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        addSubview(statusTextField)
        
        statusTextField.snp.makeConstraints { make in
            make.top.equalTo(statusLabel.snp.bottom).offset(16)
            make.leading.equalTo(fullNameLabel.snp.leading)
            make.trailing.equalTo(fullNameLabel.snp.trailing)
            make.height.equalTo(32)
        }
        
    }
    
    private func setupStatusButton() {
        
        setStatusButton.backgroundColor = .systemBlue
        setStatusButton.layer.cornerRadius = LayoutConstants.cornerRadius
        setStatusButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        setStatusButton.layer.shadowColor = UIColor.black.cgColor
        setStatusButton.layer.shadowRadius = 4
        setStatusButton.layer.shadowOpacity = 0.7
        setStatusButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        setStatusButton.setTitle("Show status", for: .normal)
        setStatusButton.setTitleColor(.white, for: .normal)
        addSubview(setStatusButton)
        
        setStatusButton.snp.makeConstraints { make in
            make.top.equalTo(statusTextField.snp.bottom).offset(16)
                    make.leading.equalTo(safeAreaLayoutGuide.snp.leading).offset(16)
                    make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing).offset(-16)
                    make.height.equalTo(48)
        }

    }
    
    private func setupAvatarImage() {
        
        avatarImageView.image = nil
        avatarImageView.layer.cornerRadius = 64
        avatarImageView.layer.borderWidth = 3
        avatarImageView.layer.borderColor = UIColor.white.cgColor
        avatarImageView.clipsToBounds = true
        
        // add a tap gesture
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapOnAvatar))
        tapGesture.numberOfTapsRequired = 1
        tapGesture.numberOfTouchesRequired = 1
        avatarImageView.isUserInteractionEnabled = true
        avatarImageView.addGestureRecognizer(tapGesture)
        
        // cancel an animation mode
        returnAvatarButton.alpha = 0
        returnAvatarButton.backgroundColor = .clear
        returnAvatarButton.contentMode = .scaleToFill
        returnAvatarButton.setImage(UIImage(systemName: "xmark", withConfiguration: UIImage.SymbolConfiguration(pointSize: 22))?.withTintColor(.black, renderingMode: .automatic), for: .normal)
        returnAvatarButton.tintColor = .black
        
        // translucent background for the modal animation mode
        avatarBackground = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        avatarBackground.backgroundColor = .darkGray
        avatarBackground.isHidden = true
        avatarBackground.alpha = 0
        
        addSubviews(avatarBackground, avatarImageView, returnAvatarButton)
        
        avatarImageView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(16)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading).offset(16)
            make.width.height.equalTo(128)
        }
        
        returnAvatarButton.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(16)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing).offset(-16)
        }
        
    }
    
    private func didTapReturnAvatar() {
        print("Return avatar button tapped")
    }
    
    var user: User? {
        didSet {
            guard let user else { return }
            fullNameLabel.text = user.fullName
            statusLabel.text = user.status
            avatarImageView.image = user.avatar
            statusText = user.status
        }
    }
    
    // MARK: - Event handlers
    
    @objc private func statusTextChanged(_ textField: UITextField) {
        statusText = textField.text ?? ""
    }
    
    @objc private func statusButtonPressed() {
        statusLabel.text = statusText
    }
    
    @objc private func didTapOnAvatar() {
        // create an animation
        avatarImageView.isUserInteractionEnabled = false
        
        ProfileViewController.postTableView.isScrollEnabled = false
        ProfileViewController.postTableView.cellForRow(at: IndexPath(row: 0, section: 0))?.isUserInteractionEnabled = false
        
        avatarOriginPoint = avatarImageView.center
        let scale = UIScreen.main.bounds.width / avatarImageView.bounds.width
        
        UIView.animate(withDuration: 0.5) {
            self.avatarImageView.center = CGPoint(x: UIScreen.main.bounds.midX,
                                                  y: UIScreen.main.bounds.midY - self.avatarOriginPoint.y)
            self.avatarImageView.transform = CGAffineTransform(scaleX: scale, y: scale)
            self.avatarImageView.layer.cornerRadius = 0
            self.avatarBackground.isHidden = false
            self.avatarBackground.alpha = 0.7
        } completion: { _ in
            UIView.animate(withDuration: 0.3) {
                self.returnAvatarButton.alpha = 1
            }
        }
    }
    
    @objc private func returnAvatarToOrigin() {
        UIImageView.animate(withDuration: 0.5) {
            UIImageView.animate(withDuration: 0.5) {
                self.returnAvatarButton.alpha = 0
                self.avatarImageView.center = self.avatarOriginPoint
                self.avatarImageView.transform = CGAffineTransform(scaleX: 1, y: 1)
                self.avatarImageView.layer.cornerRadius = self.avatarImageView.frame.width / 2
                self.avatarBackground.alpha = 0
            }
        } completion: { _ in
            ProfileViewController.postTableView.isScrollEnabled = true
            ProfileViewController.postTableView.cellForRow(at: IndexPath(row: 0, section: 0))?.isUserInteractionEnabled = true
            self.avatarImageView.isUserInteractionEnabled = true
        }
    }
}

// MARK: - Extension

extension ProfileHeaderView: UITextFieldDelegate {
    
    // tap 'done' on the keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
