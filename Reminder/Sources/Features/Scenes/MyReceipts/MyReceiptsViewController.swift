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
    private var medicines: [Medicine] = []
    
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
        setupTableView()
        loadData()
    }
    
    private func loadData() {
        medicines = viewModel.fetchData()
    }
    
    private func setupTableView() {
        contentView.tableView.delegate = self
        contentView.tableView.dataSource = self
        contentView.tableView.register(RemedyCell.self, forCellReuseIdentifier: RemedyCell.identifier)
        contentView.tableView.backgroundColor = .clear
        contentView.tableView.separatorStyle = .none
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

extension MyReceiptsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return medicines.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RemedyCell.identifier, for: indexPath) as? RemedyCell else {
            return UITableViewCell()
        }
        
        let medicine = medicines[indexPath.row]
        cell.configure(title: medicine.remedy, time: medicine.time, recurrence: medicine.recurrence)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}
