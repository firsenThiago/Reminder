//
//  HomeViewController.swift
//  Reminder
//
//  Created by Thiago Firsen on 26/02/25.
//

import UIKit

class HomeViewController: UIViewController {
    
    let contentView: HomeView
    let viewModel: HomeViewModel
    public weak var flowDelegate: HomeFlowDelegate?
    
    init(contentView: HomeView, viewModel: HomeViewModel, flowDelegate: HomeFlowDelegate) {
        self.contentView = contentView
        self.viewModel = viewModel
        self.flowDelegate = flowDelegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setup()
        setupImageGesture()
        checkForExistingData()
        setupActions()
    }
    
    private func setupActions() {
        contentView.newPrescriptionCardItem.tapAction = { [weak self] in
            self?.flowDelegate?.goToNewReceipt()
        }
        
        contentView.myPrescriptionCardItem.tapAction = { [weak self] in
            self?.flowDelegate?.gotoMyReceipts()
        }
    }
    
    private func checkForExistingData() {
        if let user = UserDefaultsManager.loadUserName() {
            contentView.nameTextField.text = user
        }
        if let image = UserDefaultsManager.loadProfileImage() {
            contentView.profileImage.image = image
        }
    }
    
    private func setupNavigationBar() {
        self.navigationController?.navigationBar.isHidden = false
        self.navigationItem.hidesBackButton = true
        let logoutButton = UIBarButtonItem(image: UIImage(named: "logout"),
                                           style: .plain,
                                           target: self, action: #selector(handleLogout))
        logoutButton.tintColor = Colors.primaryRedBase
        navigationItem.rightBarButtonItem = logoutButton
    }
    
    private func setup() {
        view.addSubview(contentView)
        setupConstraints()
        setupTextField()
        contentView.delegate = self
    }
    
    private func setupConstraints() {
        setupContentViewToBounds(contentView: contentView)
    }
    
    private func setupImageGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(profileImageTapped))
        contentView.profileImage.addGestureRecognizer(tapGesture)
    }
    
    private func setupTextField() {
        contentView.nameTextField.delegate = self
    }
    
    @objc
    private func profileImageTapped() {
        contentView.delegate?.didTapProfileImage()
    }
    
    @objc
    private func handleLogout() {
        UserDefaultsManager.removeUser()
        self.flowDelegate?.logout()
    }
}

extension HomeViewController: HomeViewDelegate {
    func didTapProfileImage() {
        self.selectProfileImage()
    }
}

extension HomeViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    private func selectProfileImage() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let editedImage = info[.editedImage] as? UIImage {
            contentView.profileImage.image = editedImage
            UserDefaultsManager.saveProfileImage(image: editedImage)
        } else if let originalImage = info[.originalImage] as? UIImage {
            contentView.profileImage.image = originalImage
            UserDefaultsManager.saveProfileImage(image: originalImage)
        }
        
        dismiss(animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true)
    }
}

extension HomeViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        let userName = contentView.nameTextField.text ?? ""
        UserDefaultsManager.saveUserName(name: userName)
        return true
    }
}
