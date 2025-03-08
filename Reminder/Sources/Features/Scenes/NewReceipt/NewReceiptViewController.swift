//
//  NewReceiptViewController.swift
//  Reminder
//
//  Created by Thiago Firsen on 07/03/25.
//

import UIKit

class NewReceiptViewController: UIViewController {
    let contentView: NewReceiptView
    let viewModel: NewReceiptViewModel
    public weak var flowDelegate: NewReceiptFlowDelegate?
    
    init(contentView: NewReceiptView,
         viewModel: NewReceiptViewModel,
         flowDelegate: NewReceiptFlowDelegate) {
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
        setup()
        setupActions()
    }
    
    private func setup() {
        self.view.backgroundColor = Colors.gray800
        self.view.addSubview(contentView)
        setupConstraints()
    }
    
    private func setupActions() {
        contentView.backButton.addTarget(self, action: #selector(handleBackButtonTapped), for: .touchUpInside)
    }
    
    private func setupConstraints() {
        setupContentViewToBounds(contentView: contentView)
    }
    
    @objc
    private func handleBackButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
}
