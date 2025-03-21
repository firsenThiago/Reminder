//
//  MyReceiptsViewController.swift
//  Reminder
//
//  Created by Thiago Firsen on 19/03/25.
//

import UIKit

class MyReceiptsViewController: UIViewController {
    let contentView: MyReceiptsView
    let viewModel: MyReceiptsViewModel
    public weak var flowDelegate: MyReceiptsFlowDelegate?
    
    init(contentView: MyReceiptsView, viewModel: MyReceiptsViewModel, flowDelegate: MyReceiptsFlowDelegate? = nil) {
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
    }
    
    
    private func setupNavigationBar() {
        self.navigationController?.navigationBar.isHidden = false
        self.navigationItem.hidesBackButton = true
        contentView.backButton.addTarget(self, action: #selector(handleBackButtonTapped), for: .touchUpInside)
        contentView.addButton.addTarget(self, action: #selector(handleAddButtonTapped), for: .touchUpInside)
    }
    
    private func setup() {
        view.addSubview(contentView)
        setupConstraints()
    }
    
    private func setupConstraints() {
        setupContentViewToBounds(contentView: contentView)
    }
    
    @objc
    private func handleAddButtonTapped() {
        flowDelegate?.navigateToNewReceipt()
    }
    
    @objc
    private func handleBackButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
}
