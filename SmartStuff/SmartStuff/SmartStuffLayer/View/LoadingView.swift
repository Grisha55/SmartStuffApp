//
//  LoadingView.swift
//  SmartStuff
//
//  Created by Григорий Виняр on 19.08.2021.
//

import UIKit

class LoadingView: UIView {

    // MARK: - Properties
    
    private let smartStuffLabel = UILabel()
    private let tableView = UITableView()
    private let loadingButton = UIButton()
    private let vectorActivityIndicator = VectorActivityIndicator()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .blackBlue
        
        configureTableView()
        configureSmartStuffLabel()
        configureLoadingButton()
        configureVectorActivityIndicator()
        
        setSmartStuffLabelConstraints()
        setTableViewConstraints()
        setLoadingButtonConstraints()
        setVectorActivityIndicatorConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    
    private func configureVectorActivityIndicator() {
        loadingButton.addSubview(vectorActivityIndicator)
        vectorActivityIndicator.startAnimation()
    }
    
    private func configureLoadingButton() {
        self.addSubview(loadingButton)
        loadingButton.backgroundColor = .white
        loadingButton.layer.cornerRadius = 26
    }
    
    private func configureTableView() {
        self.addSubview(tableView)
        tableView.showsVerticalScrollIndicator = false
        tableView.isScrollEnabled = false
        tableView.rowHeight = 250
        tableView.backgroundColor = .blackBlue
        tableView.dataSource = self
        tableView.register(EmptyCell.self, forCellReuseIdentifier: EmptyCell.identifier)
    }
    
    private func configureSmartStuffLabel() {
        self.addSubview(smartStuffLabel)
        
        smartStuffLabel.textColor = UIColor(red: 63/255, green: 73/255, blue: 86/255, alpha: 1)
        smartStuffLabel.font = smartStuffLabel.font.withSize(24)
        smartStuffLabel.numberOfLines = 0
        smartStuffLabel.lineBreakMode = .byWordWrapping
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 0.71
        smartStuffLabel.attributedText = NSMutableAttributedString(string: "Умные вещи", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
    }
    
    // Constraints
    
    private func setVectorActivityIndicatorConstraints() {
        vectorActivityIndicator.translatesAutoresizingMaskIntoConstraints = false
        vectorActivityIndicator.centerXAnchor.constraint(equalTo: loadingButton.centerXAnchor).isActive = true
        vectorActivityIndicator.centerYAnchor.constraint(equalTo: loadingButton.centerYAnchor).isActive = true
        vectorActivityIndicator.widthAnchor.constraint(equalToConstant: 18).isActive = true
        vectorActivityIndicator.heightAnchor.constraint(equalToConstant: 18).isActive = true
    }
    
    private func setLoadingButtonConstraints() {
        loadingButton.translatesAutoresizingMaskIntoConstraints = false
        loadingButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -17).isActive = true
        loadingButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -26).isActive = true
        loadingButton.widthAnchor.constraint(equalToConstant: 52).isActive = true
        loadingButton.heightAnchor.constraint(equalToConstant: 52).isActive = true
    }
    
    private func setTableViewConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: smartStuffLabel.bottomAnchor, constant: 39).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30).isActive = true
        tableView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    }
    
    private func setSmartStuffLabelConstraints() {
        smartStuffLabel.translatesAutoresizingMaskIntoConstraints = false
        smartStuffLabel.widthAnchor.constraint(equalToConstant: 77).isActive = true
        smartStuffLabel.heightAnchor.constraint(equalToConstant: 41).isActive = true
        smartStuffLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30).isActive = true
        smartStuffLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 32).isActive = true
    }
    
}

extension LoadingView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: EmptyCell.identifier, for: indexPath) as? EmptyCell else { return UITableViewCell() }
        
        return cell
    }
}
