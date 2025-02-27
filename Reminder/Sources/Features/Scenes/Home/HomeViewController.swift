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
        setupBindView()
        setup()
    }
    
    private func setupBindView() {
        self.view = contentView
    }
    
    private func setup() {
        buildHierarchy()
    }
    
    private func buildHierarchy() {
        setupContentViewToBounds(contentView: contentView)
    }
}
