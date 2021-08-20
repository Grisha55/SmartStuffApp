//
//  ErrorView+extension.swift
//  SmartStuff
//
//  Created by Григорий Виняр on 20.08.2021.
//

import UIKit

extension ErrorView {
    
    func activateErrorViewConstraints(errorLabel: UILabel, repeatButton: UIButton) {
        self.setErrorLabelConstraints(errorLabel: errorLabel)
        self.setRepeatButtonConstraints(repeatButton: repeatButton, errorLabel: errorLabel)
    }
    
    private func setRepeatButtonConstraints(repeatButton: UIButton, errorLabel: UILabel) {
        repeatButton.translatesAutoresizingMaskIntoConstraints = false
        repeatButton.topAnchor.constraint(equalTo: errorLabel.bottomAnchor, constant: 55).isActive = true
        repeatButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        repeatButton.widthAnchor.constraint(equalToConstant: 127).isActive = true
        repeatButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    private func setErrorLabelConstraints(errorLabel: UILabel) {
        errorLabel.translatesAutoresizingMaskIntoConstraints = false
        errorLabel.widthAnchor.constraint(equalToConstant: 239).isActive = true
        errorLabel.heightAnchor.constraint(equalToConstant: 58).isActive = true
        errorLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        errorLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 239).isActive = true
    }
}
