//
//  NewReceiptView.swift
//  Reminder
//
//  Created by Thiago Firsen on 07/03/25.
//

import UIKit

class NewReceiptView: UIView {
    
    let backButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "arrow.left"), for: .normal)
        button.tintColor = Colors.gray100
        return button
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = Typography.heading
        label.textColor = Colors.primaryRedBase
        label.text = "Nova receita"
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = Typography.body
        label.textColor = Colors.gray200
        label.text = "Adicione a sua prescrição médica para receber lembretes de quando tomar seu medicamento"
        label.numberOfLines = 0
        return label
    }()
    
    let addButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("+ Adicionar", for: .disabled)
        button.titleLabel?.font = Typography.subHeading
        button.backgroundColor = Colors.gray500
        button.layer.cornerRadius = Metrics.medium
        button.setTitleColor(Colors.gray800, for: .normal)
        button.isEnabled = false
        return button
    }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let remedyInput = Input(title: "Remedio", placeHolder: "Nome do medicamento")
    let timeInput = Input(title: "Horário", placeHolder: "12:00")
    let recurrenceInput = Input(title: "Recorrência", placeHolder: "Selecione")
    let takeNowCheckBox = CheckBox(title: "Tomar agora")
    
    let timePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.translatesAutoresizingMaskIntoConstraints = false
        picker.datePickerMode = .time
        picker.preferredDatePickerStyle = .wheels
        return picker
    }()
    
    let recurrencePicker: UIPickerView = {
        let picker = UIPickerView()
        picker.translatesAutoresizingMaskIntoConstraints = false
        return picker
    }()
    
    let recurrenceOptions = [
        "De hora em hora",
        "2 em 2 horas",
        "4 em 4 horas",
        "6 em 6 horas",
        "8 em 8 horas",
        "12 em 12 horas",
        "1 vez ao dia",
    ]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupTimeInput() {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(didSelectTime))
        toolbar.setItems([doneButton], animated: true)
        
        timeInput.textField.inputView = timePicker
        timeInput.textField.inputAccessoryView = toolbar
    }
    
    @objc
    private func didSelectTime() {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        timeInput.textField.text = formatter.string(from: timePicker.date)
        timeInput.textField.resignFirstResponder()
    }
    
    private func setupCurrenceInput() {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(didSelectRecurrence))
        toolbar.setItems([doneButton], animated: true)
        
        recurrenceInput.textField.inputView = recurrencePicker
        recurrenceInput.textField.inputAccessoryView = toolbar
        
        recurrencePicker.delegate = self
        recurrencePicker.dataSource = self
    }
    
    @objc
    private func didSelectRecurrence() {
        let selectedRow = recurrencePicker.selectedRow(inComponent: 0)
        recurrenceInput.textField.text = recurrenceOptions[selectedRow]
        recurrenceInput.textField.resignFirstResponder()
    }
    
    private func validateInputs() {
        let isRemeddyFilled = !(remedyInput.textField.text ?? "").isEmpty
        let isTimeFilled = !(timeInput.textField.text ?? "").isEmpty
        let isRecurrenceFilled = !(recurrenceInput.textField.text ?? "").isEmpty
        if isRemeddyFilled && isTimeFilled && isRecurrenceFilled {
            addButton.setTitle("+ Adicionar", for: .normal)
            addButton.backgroundColor = Colors.primaryRedBase
            addButton.isEnabled = true
        } else {
            addButton.setTitle("+ Adicionar", for: .disabled)
            addButton.backgroundColor = Colors.gray500
            addButton.isEnabled = false
        }
    }
    
    private func setupObservables() {
        remedyInput.textField.addTarget(self, action: #selector(inputDidChange), for: .editingDidEnd)
        timeInput.textField.addTarget(self, action: #selector(inputDidChange), for: .editingDidEnd)
        recurrenceInput.textField.addTarget(self, action: #selector(inputDidChange), for: .editingDidEnd)
    }
    
    @objc
    private func inputDidChange() {
        validateInputs()
    }
    
    private func setupUI() {
        addSubview(backButton)
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        addSubview(stackView)
        stackView.addArrangedSubview(remedyInput)
        stackView.addArrangedSubview(timeInput)
        stackView.addArrangedSubview(recurrenceInput)
        stackView.addArrangedSubview(takeNowCheckBox)
        addSubview(addButton)
        setupConstraints()
        setupTimeInput()
        setupCurrenceInput()
        setupObservables()
        
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: Metrics.high),
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.high),
            backButton.heightAnchor.constraint(equalToConstant: 24),
            backButton.widthAnchor.constraint(equalToConstant: 24),
            
            titleLabel.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: Metrics.medium),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.high),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.high),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Metrics.tiny),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.high),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.high),
            
            stackView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: Metrics.extraLarge),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.high),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.high),
            
            addButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.high),
            addButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.high),
            addButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -Metrics.small),
            addButton.heightAnchor.constraint(equalToConstant: Metrics.buttonSize)
        ])
    }
}

extension NewReceiptView: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return recurrenceOptions.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return recurrenceOptions[row]
    }
}
