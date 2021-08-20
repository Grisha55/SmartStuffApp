//
//  LoadingView+extension.swift
//  SmartStuff
//
//  Created by Григорий Виняр on 20.08.2021.
//

import UIKit

extension LoadingView {
    
    func activateLoadingViewConstraints(smartStuffLabel: UILabel, tableView: UITableView, loadingButton: UIButton, vectorActivityINdicator: VectorActivityIndicator) {
        self.setSmartStuffLabelConstraints(smartStuffLabel: smartStuffLabel)
        self.setTableViewConstraints(tableView: tableView, smartStuffLabel: smartStuffLabel)
        self.setLoadingButtonConstraints(loadingButton: loadingButton)
        setVectorActivityIndicatorConstraints(vectorActivityIndicator: vectorActivityINdicator, loadingButton: loadingButton)
    }
    
    private func setVectorActivityIndicatorConstraints(vectorActivityIndicator: VectorActivityIndicator, loadingButton: UIButton) {
        vectorActivityIndicator.translatesAutoresizingMaskIntoConstraints = false
        vectorActivityIndicator.centerXAnchor.constraint(equalTo: loadingButton.centerXAnchor).isActive = true
        vectorActivityIndicator.centerYAnchor.constraint(equalTo: loadingButton.centerYAnchor).isActive = true
        vectorActivityIndicator.widthAnchor.constraint(equalToConstant: 18).isActive = true
        vectorActivityIndicator.heightAnchor.constraint(equalToConstant: 18).isActive = true
    }
    
    private func setLoadingButtonConstraints(loadingButton: UIButton) {
        loadingButton.translatesAutoresizingMaskIntoConstraints = false
        loadingButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -17).isActive = true
        loadingButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -26).isActive = true
        loadingButton.widthAnchor.constraint(equalToConstant: 52).isActive = true
        loadingButton.heightAnchor.constraint(equalToConstant: 52).isActive = true
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
