//
//  SplashView.swift
//  Reminder
//
//  Created by Thiago Firsen on 04/02/25.
//

import UIKit

class SplashView: UIView {
    
    init() {
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        self.backgroundColor = .blue
        setupConstraints()
    }
    
    private func setupConstraints() {
        
    }
}
