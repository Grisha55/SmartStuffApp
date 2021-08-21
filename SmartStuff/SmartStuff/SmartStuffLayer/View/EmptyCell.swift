//
//  EmptyCell.swift
//  SmartStuff
//
//  Created by Григорий Виняр on 19.08.2021.
//

import UIKit

class EmptyCell: UITableViewCell {

    // MARK: - Propterties
    
    static let identifier = "EmptyCell"
    private let pointView = UIView()
    private let networkStatusView = UIView()
    private let nameView = UIView()
    private let workStatusLabel = UIView()
    private let backView = UIView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .blackBlue
        
        configureBackView()
        configurePointView()
        configureNetworkStatusView()
        configureNameView()
        configureWorkStatusView()
        
        setBackViewConstraints()
        setPointViewConstraints()
        setNetworkStatusLabelConstraints()
        setNameViewConstraints()
        setWorkStatusViewConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    
    private func configureWorkStatusView() {
        backView.addSubview(workStatusLabel)
        workStatusLabel.backgroundColor = .grayBlue
        workStatusLabel.layer.cornerRadius = 13
    }
    
    private func configureNameView() {
        backView.addSubview(nameView)
        nameView.backgroundColor = .grayBlue
        nameView.layer.cornerRadius = 5
    }
    
    private func configureNetworkStatusView() {
        backView.addSubview(networkStatusView)
        networkStatusView.backgroundColor = .grayBlue
        networkStatusView.layer.cornerRadius = 5
    }
    
    private func configurePointView() {
        backView.addSubview(pointView)
        pointView.backgroundColor = .grayBlue
        pointView.layer.cornerRadius = 6
    }
    
    private func configureBackView() {
        self.addSubview(backView)
        backView.backgroundColor = UIColor(red: 64/255, green: 72/255, blue: 84/255, alpha: 1)
        backView.layer.cornerRadius = 15
    }
    
    // Constraints
    
    private func setWorkStatusViewConstraints() {
        workStatusLabel.translatesAutoresizingMaskIntoConstraints = false
        workStatusLabel.widthAnchor.constraint(equalToConstant: 130).isActive = true
        workStatusLabel.heightAnchor.constraint(equalToConstant: 27).isActive = true
        workStatusLabel.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 14).isActive = true
        workStatusLabel.topAnchor.constraint(equalTo: nameView.bottomAnchor, constant: 90).isActive = true
    }
    
    private func setNameViewConstraints() {
        nameView.translatesAutoresizingMaskIntoConstraints = false
        nameView.widthAnchor.constraint(equalToConstant: 168).isActive = true
        nameView.heightAnchor.constraint(equalToConstant: 28).isActive = true
        nameView.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 19).isActive = true
        nameView.topAnchor.constraint(equalTo: networkStatusView.bottomAnchor, constant: 15).isActive = true
    }
    
    private func setNetworkStatusLabelConstraints() {
        networkStatusView.translatesAutoresizingMaskIntoConstraints = false
        networkStatusView.widthAnchor.constraint(equalToConstant: 46).isActive = true
        networkStatusView.heightAnchor.constraint(equalToConstant: 12).isActive = true
        networkStatusView.leadingAnchor.constraint(equalTo: pointView.trailingAnchor, constant: 7).isActive = true
        networkStatusView.topAnchor.constraint(equalTo: backView.topAnchor, constant: 17).isActive = true
    }
    
    private func setPointViewConstraints() {
        pointView.translatesAutoresizingMaskIntoConstraints = false
        pointView.widthAnchor.constraint(equalToConstant: 12).isActive = true
        pointView.heightAnchor.constraint(equalToConstant: 12).isActive = true
        pointView.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 19).isActive = true
        pointView.topAnchor.constraint(equalTo: backView.topAnchor, constant: 17).isActive = true
    }
    
    private func setBackViewConstraints() {
        backView.translatesAutoresizingMaskIntoConstraints = false
        backView.widthAnchor.constraint(equalToConstant: 300).isActive = true
        backView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        backView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        backView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true
    }
    
}
