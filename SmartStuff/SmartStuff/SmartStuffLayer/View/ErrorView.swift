//
//  ErrorView.swift
//  SmartStuff
//
//  Created by Григорий Виняр on 19.08.2021.
//

import UIKit

protocol ErrorViewDelegate: AnyObject {
    func repeatAction()
}

class ErrorView: UIView {
    
    // MARK: - Properties
    
    private let errorLabel = UILabel()
    private let repeatButton = UIButton()
    var errorViewDelegate: ErrorViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .blackBlue
        
        configureErrorLabel()
        configureRepeatButton()
        
        self.activateErrorViewConstraints(errorLabel: errorLabel, repeatButton: repeatButton)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    
    private func configureRepeatButton() {
        self.addSubview(repeatButton)
        repeatButton.setTitle("ПОВТОРИТЬ", for: .normal)
        repeatButton.backgroundColor = UIColor(red: 20/255, green: 23/255, blue: 89/255, alpha: 1)
        repeatButton.setTitleColor(.white, for: .normal)
        repeatButton.layer.cornerRadius = 20
        repeatButton.titleLabel?.font = repeatButton.titleLabel?.font.withSize(14)
        repeatButton.addTarget(self, action: #selector(repeatButtonDidTapped), for: .touchUpInside)
    }
    
    @objc private func repeatButtonDidTapped() {
        errorViewDelegate?.repeatAction()
    }
    
    private func configureErrorLabel() {
        self.addSubview(errorLabel)
        errorLabel.text = "Что то пошло не так, ошибка 123"
        errorLabel.font = errorLabel.font.withSize(24)
        errorLabel.textAlignment = .center
        errorLabel.textColor = .white
        errorLabel.numberOfLines = 0
    }
       
}
