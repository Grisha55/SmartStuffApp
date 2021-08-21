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
        
        self.activateLoadingViewConstraints(smartStuffLabel: smartStuffLabel, tableView: tableView, loadingButton: loadingButton, vectorActivityINdicator: vectorActivityIndicator)
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
    
}

// MARK: - UITableViewDataSource
extension LoadingView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: EmptyCell.identifier, for: indexPath) as? EmptyCell else { return UITableViewCell() }
        
        return cell
    }
}
