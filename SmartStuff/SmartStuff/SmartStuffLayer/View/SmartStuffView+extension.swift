//
//  SmartStuffView+extension.swift
//  SmartStuff
//
//  Created by Григорий Виняр on 17.08.2021.
//

import UIKit

extension SmartStuffView {
    
    func activateAllConstraints(smartStuffLabel: UILabel, tableView: UITableView, updateButton: UIButton, customAlert: CustomAlert) {
        self.setSmartStuffLabelConstraints(smartStuffLabel: smartStuffLabel)
        self.setTableViewConstraints(tableView: tableView, smartStuffLabel: smartStuffLabel)
        self.setUpdateButtonConstraints(updateButton: updateButton)
        self.setCustomAlertConstraints(customAlert: customAlert)
        //self.setErrorLabelConstraints(errorLabel: errorLabel)
        //self.setRepeatButtonConstraints(repeatButton: repeatButton, errorLabel: errorLabel)
    }
    
    private func setRepeatButtonConstraints(repeatButton: UIButton, errorLabel: UILabel) {
        repeatButton.translatesAutoresizingMaskIntoConstraints = false
        repeatButton.topAnchor.constraint(equalTo: errorLabel.bottomAnchor, constant: 55).isActive = true
        repeatButton.widthAnchor.constraint(equalToConstant: 127).isActive = true
        repeatButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        repeatButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    }
    
    private func setErrorLabelConstraints(errorLabel: UILabel) {
        errorLabel.translatesAutoresizingMaskIntoConstraints = false
        errorLabel.widthAnchor.constraint(equalToConstant: 239).isActive = true
        errorLabel.heightAnchor.constraint(equalToConstant: 58).isActive = true
        errorLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        errorLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 239).isActive = true
    }
    
    private func setCustomAlertConstraints(customAlert: UIView) {
        customAlert.translatesAutoresizingMaskIntoConstraints = false
        customAlert.widthAnchor.constraint(equalToConstant: 299).isActive = true
        customAlert.heightAnchor.constraint(equalToConstant: 201).isActive = true
        customAlert.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        customAlert.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
    
    private func setUpdateButtonConstraints(updateButton: UIButton) {
        updateButton.translatesAutoresizingMaskIntoConstraints = false
        updateButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -17).isActive = true
        updateButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -13).isActive = true
        updateButton.widthAnchor.constraint(equalToConstant: 143).isActive = true
        updateButton.heightAnchor.constraint(equalToConstant: 51).isActive = true
    }
    
    private func setTableViewConstraints(tableView: UITableView, smartStuffLabel: UILabel) {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: smartStuffLabel.bottomAnchor, constant: 39).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30).isActive = true
        tableView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    }
    
    private func setSmartStuffLabelConstraints(smartStuffLabel: UILabel) {
        smartStuffLabel.translatesAutoresizingMaskIntoConstraints = false
        smartStuffLabel.widthAnchor.constraint(equalToConstant: 77).isActive = true
        smartStuffLabel.heightAnchor.constraint(equalToConstant: 41).isActive = true
        smartStuffLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30).isActive = true
        smartStuffLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 32).isActive = true
    }
    
}
